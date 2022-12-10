
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class StoryOneWidget extends StatelessWidget {
  final String img;
  final String name;
  const StoryOneWidget({super.key, required this.img, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              border: Border.all(
                width: 3,
                color: Color(0xFFb29e84),
              )),
          child: Container(
            //padding: EdgeInsets.all(2.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: CachedNetworkImage(
                imageUrl: img,
                fit: BoxFit.cover,
                height: 70,
                width: 70,
              ),
            ),
          ),
        ),
        const SizedBox(height: 7),

        
        Text(
          name,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 13.0),
        ),
      ],
    );
  }
}
