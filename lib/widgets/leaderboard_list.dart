import 'package:flutter/material.dart';
import 'package:tastebuds/model/objects/post.dart'; // Adjust based on your actual model (e.g., User or Post)
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tastebuds/model/post_model.dart';
import '../pages/post_page.dart';
import 'package:tastebuds/model/dummy_data.dart';
import 'package:tastebuds/model/objects/post.dart';
import '/widgets/bottom_nav_bar.dart';


class LeaderboardList extends StatelessWidget {
  final List<Post> posts; // Adjust to List<User> or your ranking model if needed

  const LeaderboardList({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    final random = Random(); // Define Random instance here
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final item = posts[index]; // Represents a post or user with ranking data
        final rank = index + 1; // Rank starts at 1

        // Determine rank color and icon based on position
        Color rankColor = Colors.black;
        Widget? rankIcon;
        if (rank == 1) {
          rankColor = Colors.orange; 
          rankIcon = Icon(Icons.star, color: Colors.yellow, size: 20); // Yellow crown for #1
        } else if (rank <= 3) {
          rankColor = Colors.green; // Orange for top 3 (adjust if needed)
        }

        // Mock rank change indicator (green up arrow or red down arrow)
        bool isRankUp = index % 2 == 0; // Mock logic; replace with real data if available
        Color rankChangeColor = isRankUp ? Colors.green : Colors.red;
        IconData rankChangeIcon = isRankUp ? Icons.arrow_drop_up : Icons.arrow_drop_down;

        return ListTile(
          onTap: () {
          context.read<PostModel>().setPost(postId: item.id);
          Navigator.push(context,
          MaterialPageRoute(
            builder: (context) => PostPage()
          )
        );
      },
          leading: CircleAvatar(
            backgroundImage: NetworkImage(item.imageUrl), // Default placeholder if no image
            radius: 20,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.author, // Replace with actual user or post name
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              
                       
              Row(
               children: [
                  const Icon(Icons.thumb_up, size: 14, color: Colors.grey), // 👍 Thumbs-up icon
                  const SizedBox(width: 2), // Small spacing between icon and text
                  Text(
                    '${item.likes}', // Number of likes
                    style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                   ),
                  ),
               ],
              )

            ],
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rank #$rank',
                style: TextStyle(
                  fontSize: 14,
                  color: rankColor, // Dynamic color for rank (purple for #1, etc.)
                ),
              ),
              Row(
                children: [
                  Icon(rankChangeIcon, size: 16, color: rankChangeColor), // Rank change indicator
                  Text(
                    '${isRankUp ? '+' : '-'}${random.nextInt(5) + 1}', // Mock rank change value (e.g., +2, -3)
                    style: TextStyle(
                      fontSize: 12,
                      color: rankChangeColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          trailing: rankIcon, //star for #1, null otherwise
        );
      },
    );
  }
}