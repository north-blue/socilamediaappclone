import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:socilamedia_one_flutter/constant/constant.dart';

class UserPostWidget extends StatelessWidget {
  final String name;

  const UserPostWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            //to spread it out
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                //1

                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(name), //see if error
                  //const Icon(Icons.menu)
                ],
              ),
              const Icon(Icons.menu)
            ],
          ),
        ),
//post
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 400,
            //( 'images\summer_landscape_with_water.jpg'),

             decoration: const BoxDecoration(
                      image: DecorationImage(image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/instaclone-96d22.appspot.com/o/sky_clouds_rays_blue_1%20(1).jpg?alt=media&token=560959cd-8601-4aae-acce-85e2802a165d'),
                      fit: BoxFit.fill,
                      
                      
                      )
                    ),

            
            
          ),
        ),

//below the post -> buttons

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            //1
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.favorite),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Icon(Icons.chat_bubble_outline),
                  ),
                  Icon(Icons.share),
                ],
              ),
              const Icon(Icons.bookmark),
            ],
          ),
        ),

//comment

        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(
            children: const [
              Text('Likes by'),
              Text(' aris', style: TextStyle(fontWeight: FontWeight.bold)),
              Text(' and'),
              Text(' other', style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
        ),

//caption

        Padding(
          padding: const EdgeInsets.only(left: 5.0, top: 8),
          //padding: const EdgeInsets.only(left: 2.0,top:8),
          child: RichText(
              text: TextSpan(
                  //default textstyle
                  style: const TextStyle(color: Colors.black),
                  children: [
                TextSpan(
                    text: name,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const TextSpan(
                  text: '  Summer landscape',
                ),
              ])),
        ),
      ],
    );
  }
}
