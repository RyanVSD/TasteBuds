import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  const Content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Title",
          style: TextStyle(
            fontSize: 32, 
            fontWeight: FontWeight.bold, 
            color: Colors.black,
            ),
        ),
         Text("author",
          style: TextStyle(
            fontSize: 24, 
            color: Colors.black,
            ),
        ),
        Center(
          child: Column(
            children: [
              Text("Ingredient List", style:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
              )),
            ],
          ),
        ),
        Center(
          child: Column(
            children: [
              Text("Instruction List"),
            ],
          ),
        ),
        Row(
          children: [
            Text("Difficulty: **")
          ],
        ),
        Row(
          children: [
            Text("Taste: *****")
          ],
        ),
        Row(
          children: [
            Text("Price: ***")
          ],
        )
      ],
    );
  }
}