import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:tastebuds/model/amplify/ModelProvider.dart';
import 'package:tastebuds/model/post_model.dart';
import 'package:tastebuds/model/user_model.dart';
import 'package:tastebuds/pages/widget/post_card.dart';
import 'package:tastebuds/pages/widget/post_grid.dart';
import '../model/objects/post_item.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});


  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;// Initially invisible

  late ScrollController _scrollController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _scrollController = ScrollController();
    context.read<UserModel>().userLogin();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverToBoxAdapter(
            child: Container(
              height: 280,
              // color: Theme.of(context).colorScheme.secondary,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: Theme.of(context).brightness == Brightness.dark ? 
                   [Theme.of(context).colorScheme.surface,Theme.of(context).colorScheme.surface ] : [Theme.of(context).colorScheme.secondary, Theme.of(context).colorScheme.surface],
                  begin: Alignment.topCenter, // Start position
                  end: Alignment(0,0.9), // End position
                ),
              ),

              padding: const EdgeInsets.fromLTRB(16,30,16,10),
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    child:  SignOutButton()
                    ),
                  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/blank_profile.png'),
                        ),
                        const SizedBox(width: 16),
                
                        //  Name & ID
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.watch<UserModel>().user?.preferredUsername ?? "User123",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'TasteBuds ID: ${context.watch<UserModel>().user?.username ?? "-1"}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).brightness == Brightness.dark ? Colors.grey[500] : Colors.grey[800],
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                
                    const SizedBox(height: 16),
                
                    //  Stats Row: Posts, Following, Followers
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatsItem(context.watch<UserModel>().user?.followingCount.toString() ?? '0' , 'Following'),
                        _buildStatsItem(context.watch<UserModel>().user?.followerCount.toString() ?? '0' , 'Followers'),
                      ],
                    ),
                  ],
                ),]
              ),
            ),
          ),

          //  Tab Bar (This will scroll out of view)
          SliverPersistentHeader(
            pinned: true, // Keeps it at the top when scrolling
            delegate: _SliverAppBarDelegate(
              TabBar(
                controller: _tabController,
                labelColor: Theme.of(context).colorScheme.onSurface,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Theme.of(context).colorScheme.secondary,
                tabs: const [
                  Tab(text: 'Posts'),
                  Tab(text: 'Favorites'),
                ],
              ),
            ),
          ),
        ],

        // The main body (scrolls with the whole page)
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildPostsList(), // Posts now scroll as part of the whole page
            const Center(child: Text('Favorites Tab')),
          ],
        ),
      ),
    );
  }

  // Helper method to display post statistics
  Widget _buildStatsItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  // _buildPostsList() method (scrolls inside TabBarView)
  Widget _buildPostsList() {
    Future<List<PostItem?>> posts = context.watch<PostModel>().getPostList(10);

    return FutureBuilder<List<PostItem?>>(
        future: posts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show loading indicator while waiting for data
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Show error message if something went wrong
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Handle case where no data is available
            return const Center(child: Text('No posts available.'));
          } else {
            List<PostItem?> posts = snapshot.data!;
            return PostGrid(posts: Future.value(posts));
          }
        });
  }
}

//  Helper class to keep the Tab Bar pinned at the top
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  _SliverAppBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height + 72;
  @override
  double get maxExtent => tabBar.preferredSize.height + 72;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TabBar remains at the top
          tabBar,

          const SizedBox(height: 8), // Add spacing between tab bar and search

          // Search Bar below the Tab Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Icon(Icons.search),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Search...',
                      border: InputBorder.none, // Removes default underline
                    ),
                    onChanged: (value) {
                      // Search
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
