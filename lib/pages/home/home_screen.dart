
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socilamedia_one_flutter/constant/constant.dart';
import 'package:socilamedia_one_flutter/pages/home/story_widget.dart';
import 'package:socilamedia_one_flutter/pages/home/userpost_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//make the methods

class _HomePageState extends State<HomePage> {
  final List people = [
    'ares',
    'daemyra',
    'claude',
    'emma',
    'athena',
    'howls'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: backgroundColor,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'SocialMediaApp',
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: titleTextColor,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            story(),

            const Divider(
                color: searchToolBarColor, thickness: 0.5, height: 0.0),

            

            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: people.length,
                  itemBuilder: (context, index) {
                    return UserPostWidget(name: people[index]);
                  }),
            ),
          ],
        ));
  }

//wrap it into widget
  Widget story() {
    return SizedBox(
      height: 100,
      //1st ListView
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: people.length,
          itemBuilder: (context, index) {
            return StoryOneWidget(
                img:
                    //add the access image url otherwise error
                    'https://firebasestorage.googleapis.com/v0/b/instaclone-96d22.appspot.com/o/sky_clouds_rays_blue_1%20(1).jpg?alt=media&token=560959cd-8601-4aae-acce-85e2802a165d',
                name: people[index]);
          }),
    );
  }
}
