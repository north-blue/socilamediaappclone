
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socilamedia_one_flutter/base/bottom_nav/bottom_nav.dart';

import 'package:socilamedia_one_flutter/constant/constant.dart';
import 'package:socilamedia_one_flutter/pages/editprofile/edit_profile_screen.dart';
import 'package:socilamedia_one_flutter/pages/home/home_screen.dart';


import '../../auth/login/login_view.dart';

class ProfileUi extends StatefulWidget {
  const ProfileUi({super.key});

  @override
  State<ProfileUi> createState() => _ProfileUiState();
}

class _ProfileUiState extends State<ProfileUi> {



//not working for the backpressed on statefulwideget
  void OnPressed(BuildContext context){

      setState(() {});
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomNavPage()),
                          );

  }



 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: backgroundColor,
          leading: const Padding(
            padding: EdgeInsets.only(left: 10.0),

            //icon button for stateful see that
            
             child:Icon(
                Icons.arrow_back,
                color: titleTextColor,
                
              ),

            
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/instaclone-96d22.appspot.com/o/sky_clouds_rays_blue_1%20(1).jpg?alt=media&token=560959cd-8601-4aae-acce-85e2802a165d',
                        fit: BoxFit.cover,
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'UserName',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.hammersmithOne(
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                        color: titleTextColor,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      '@User',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: titleTextColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          '1908',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Following',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      //for side spacing
                      color: Colors.black54,
                      width: 4,
                      height: 15,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          '2890',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Followers',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  //for signout button
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Sign Out
                    Container(
                      width: 100,
                      height: 47,
                      decoration: BoxDecoration(
                        color: titleTextColor,
                        border: Border.all(
                          color: titleTextColor,
                        ),
                      ),
                      child: Center(
                        child: InkWell(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          )),
                          child: Text(
                            'Sign Out',
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: backgroundColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),

                    //Edit profile
                    Container(
                      width: 100,
                      height: 47,
                      decoration: BoxDecoration(
                        color: titleTextColor,
                        border: Border.all(
                          color: titleTextColor,
                        ),
                      ),
                      child: Center(
                        child: InkWell(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>  EditProfileScreen(),
                          )),
                          child: Text(
                            'Edit Profile',
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: backgroundColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  //for signout button
                  height: 15,
                  width: 15,
                ),
                GridView.builder(
                    itemCount: 32,
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5),
                    itemBuilder: (context, index) {
                      return Container(
                        width: 100,
                        height: 100,
                        color: searchToolBarColor,
                      );
                    })
              ],
            ),
          ),
        ));
  }
}
