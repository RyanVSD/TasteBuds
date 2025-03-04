import 'package:flutter/material.dart';
import 'package:tastebuds/model/objects/post_item.dart';
import 'package:tastebuds/model/post_model.dart';
import 'package:tastebuds/pages/other_profile_page.dart';
import 'package:tastebuds/pages/widget/step.dart';
import 'package:tastebuds/service/post_service.dart';
import 'package:provider/provider.dart';


class PostPage extends StatefulWidget {
  const PostPage({super.key, required this.post});

  final PostItem? post;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  bool isFollowed = false;
  String imUrl =
      "https://media.istockphoto.com/id/1147544807/vector/thumbnail-image-vector-graphic.jpg?s=612x612&w=0&k=20&c=rnCKVbdxqkjlcs3xH87-9gocETqpspHFXu5dIGB4wuM=";
  String profileImg = 'assets/blank_profile.png';
  int difficultyRating = 0;
  int tasteRating = 0;
  bool isLiked = false;
  bool isFavorited = false;

  Widget _buildStarRating(int rating, Function(int) onRatingSelected) {
    return Row(
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            size: 30,
            index < rating ? Icons.star : Icons.star_border,
            color: Colors.amber,
          ),
          onPressed: () { 
            int newRating = index + 1;
            setState(() {
              onRatingSelected(newRating);
              context.read<PostModel>().setPostRating(widget.post!.id, tasteRating, difficultyRating);
            });
          },
        );
      }),
    );
  }

  void updImUrl() async {
    PostItem? p = widget.post;
    if (p != null) {
      String newPath = await getS3Url(p.imageUrl);
      setState(() => imUrl = newPath);
    } 
  }

  void loadRating() async {
    Map<String, int>? res;
    if (widget.post != null) {
      res = await context.read<PostModel>().getPostRating(widget.post!.id);
    }
    setState(() {
      difficultyRating = res?["difficulty"] ?? 0;
      tasteRating = res?["taste"] ?? 0;
    });
  }

  @override
  initState() {
    super.initState();
    updImUrl();
    loadRating();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background Image (Parallax Effect)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 400, // Fixed height for the image
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          DraggableScrollableSheet(
            initialChildSize: 0.6, // Starts below the image
            minChildSize: 0.6,
            maxChildSize: 0.85,
            builder: (context, scrollController) {
              return Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.post!.title,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.post!.authorId ?? "",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text("Difficulty: ",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                ...List.generate(
                                    widget.post!.difficulty.toInt(), (e) {
                                  return Icon(Icons.star,
                                      color: Color(0xFFFBC02E));
                                }),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .tertiaryContainer,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      isLiked
                                          ? Icons.thumb_up
                                          : Icons.thumb_up_off_alt,
                                      color: isLiked
                                          ? Theme.of(context)
                                              .colorScheme
                                              .primaryFixedDim
                                          : Theme.of(context)
                                              .colorScheme
                                              .onSurface,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isLiked = !isLiked;
                                      });
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      isFavorited
                                          ? Icons.star
                                          : Icons.star_border,
                                      color: isFavorited
                                          ? Theme.of(context)
                                              .colorScheme
                                              .primaryFixedDim
                                          : Theme.of(context)
                                              .colorScheme
                                              .onSurface,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isFavorited = !isFavorited;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ingredients",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24, // Golden color
                              ),
                            ),
                            SizedBox(height: 8),
                            ...widget.post!.ingredients.map((ing) => Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: Text(
                                    "- $ing",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                )),
                            SizedBox(height: 16),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Steps",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(height: 8),
                            ...widget.post!.steps.map((step) => Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: StepCard(step: step),
                                )),
                            SizedBox(height: 16),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Difficulty Ratings",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            _buildStarRating(
                                difficultyRating,
                                (rating) =>difficultyRating = rating),
                            Text(
                              "Taste Ratings",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            _buildStarRating(
                                tasteRating,
                                (rating) => tasteRating = rating),
                          ],
                        ),
                      ],
                    ),
                  ));
            },
          ),

          /// Back Button on Top of Image
          Positioned(
            top: kToolbarHeight / 2,
            left: 16,
            child: CircleAvatar(
              backgroundColor: Colors.black54,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),

          Positioned(
            top: kToolbarHeight / 2,
            right: 16,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Profile pic
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OtherProfilePage(
                                  userId: widget.post!.authorId!)));
                    },
                    child: CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage(profileImg),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  // Follow btn
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: isFollowed
                        ? Theme.of(context).colorScheme.tertiaryFixedDim
                        : Theme.of(context).colorScheme.secondary,
                    child: IconButton(
                      icon: isFollowed
                          ? Icon(Icons.remove, color: const Color(0xFF000000))
                          : Icon(Icons.add, color: const Color(0xFF000000)),
                      onPressed: () {
                        setState(() {
                          isFollowed = !isFollowed;
                        });
                      },
                      iconSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
