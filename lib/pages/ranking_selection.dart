import 'package:flutter/material.dart';
import 'package:tastebuds/pages/ranking_page.dart';
import '../widgets/bottom_nav_bar.dart';

class RankingSelectionPage extends StatelessWidget {
  const RankingSelectionPage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavBar(),
      floatingActionButton: AddPostButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: true,
            // NEW: Use SliverAppBar with a gradient for fade effect
            expandedHeight: 10.0, // Adjust height as needed
            
            backgroundColor: Colors.white, // Base color (will be overridden by gradient)
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 233, 197, 37), // Top color (yellow)
                      Colors.white, // Bottom color (white, fades into background)
                    ],
                  ),
                ),
                
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
              
                const SizedBox(height: 10),
                _buildCategoryCard(
                  context,
                  title: 'Most Liked Recipes',
                  imageUrl: 'https://robbreport.com/wp-content/uploads/2024/08/Sons-Daughters-Michelin.jpg?w=1024', // Mock image for recipes
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RankingPage()),
                  ),
                ),
                _buildSubCard(
                  context,
                  title: 'Fast and Furious',
                  
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RankingPage()),
                  ),
                ),
                _buildSubCard(
                  context,
                  title: 'DLG Remake',
                  
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RankingPage()),
                  ),
                ),
                _buildCategoryCard(
                  context,
                  title: 'Most Liked: Japanese',
                  imageUrl: 'https://img.jakpost.net/c/2017/02/24/2017_02_24_22239_1487924367._large.jpg', // Mock image for recipes
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RankingPage()),
                  ),
                ),
                _buildSubCard(
                  context,
                  title: 'FastFood King',
                  
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RankingPage()),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, {required String title, required String imageUrl, required VoidCallback onTap}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Rounded edges for square card
      ),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            // Fill card with image, covering the entire area
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: 200, // Adjust height for square appearance
                fit: BoxFit.cover, // Ensure image fills the card
              ),
            ),
            // Category name at bottom left in light grey
            Positioned(
              bottom: 14.0,
              left: 14.0,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Light grey for text
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildSubCard(BuildContext context, {required String title, required VoidCallback onTap}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Rounded edges for square card
      ),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            // Fill card with image, covering the entire area
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                "https://www.shutterstock.com/image-vector/flat-minimalist-geometric-fruit-leaf-600nw-1969645471.jpg",
                width: double.infinity,
                height: 100, // Adjust height for square appearance
                fit: BoxFit.cover, // Ensure image fills the card
              ),
            ),
            // Category name at bottom left in light grey
            Positioned(
              bottom: 8.0,
              left: 14.0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 0.5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Light grey for text
                ),
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
