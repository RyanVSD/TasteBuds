import 'package:flutter/material.dart';
import '../model/dummy_data.dart';
import '../model/objects/post.dart';

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          'https://www.shutterstock.com/image-photo/hiking-switzerland-interlaken-jungfrau-region-600nw-2272449171.jpg',
                        ),
                      ),
                      const SizedBox(width: 16),

                      //  Name & ID
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Granny Sue',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'TasteBuds ID: 93786',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).brightness == Brightness.dark ? Colors.grey[500] : Colors.grey[800],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Plus Icon
                      const Icon(
                        Icons.add_circle,
                        size: 30,
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  //  Stats Row: Posts, Following, Followers
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatsItem('12', 'Posts'),
                      _buildStatsItem('54', 'Following'),
                      _buildStatsItem('23k', 'Followers'),
                    ],
                  ),
                ],
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
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: dummyPosts.length,
      itemBuilder: (ctx, index) {
        final Post post = dummyPosts[index];

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Post Image
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.network(
                  post.imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              // Post Details
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      post.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    // Author Name
                    Text(
                      'By ${post.author}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Likes & Favorites Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.thumb_up,
                                size: 16, color: Colors.blue),
                            const SizedBox(width: 4),
                            Text('${post.likes} Likes'),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.favorite,
                                size: 16, color: Colors.red),
                            const SizedBox(width: 4),
                            Text('${post.favorites} Favorites'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
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
