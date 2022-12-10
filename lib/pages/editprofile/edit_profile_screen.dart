// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:image_picker/image_picker.dart';

import 'package:socilamedia_one_flutter/constant/constant.dart';

import 'package:socilamedia_one_flutter/pages/profile/profileui.dart';

import 'package:socilamedia_one_flutter/widget/edit_inut_widget.dart';



class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController editUserNameTextEditingController =
      TextEditingController();

  final TextEditingController editBioEditingController =
      TextEditingController();

  File? imagefile;

  void getImage(ImageSource source) async {
    final file = await ImagePicker().pickImage(source: source);
    if (file?.path != null) {
      setState(() {
        imagefile = File(file!.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text('Edit Profile',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.hammersmithOne(
                        fontSize: 50,
                        fontWeight: FontWeight.w300,
                        color: titleTextColor,
                      )),

                  const SizedBox(
                    height: 25,
                  ),

                  Stack(
                    //for image
                    children: [
                      //for image

                      const CircleAvatar(
                        radius: 64,
                        backgroundImage: NetworkImage(
                           // 'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png'),
'https://firebasestorage.googleapis.com/v0/b/instaclone-96d22.appspot.com/o/sky_clouds_rays_blue_1%20(1).jpg?alt=media&token=560959cd-8601-4aae-acce-85e2802a165d'),
                        backgroundColor:
                            Colors.black, //bgcolor when images is loading up
                      ),

                      Positioned(
                        bottom: -10,
                        left: 80,
                        child: IconButton(
                          onPressed: () =>
                             
                              getImage(ImageSource
                                  .gallery), //print(  'Hello'), //method thet pick image from galllery
                          icon: const Icon(
                            Icons.add_a_photo, //side images
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),

//username of username
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: EditInputClass(
                      textEditingController: editUserNameTextEditingController,
                      hintText: 'username',
                      labelText: 'username',
                      isObsure: false,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: EditInputClass(
                      textEditingController: editBioEditingController,
                      hintText: 'Bio',
                      labelText: 'Bio',
                      isObsure: false,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 80,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: searchToolBarColor,
                        ),
                        child: MaterialButton(
                          //color: kBtnBgColor,
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                            child: Text(
                              "Update",
                              style: btnTxtStyle,
                            ),
                          ),
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProfileUi(),
                            ),
                          ),

                          //updateSaveProfile(editBioEditingController.text, imageFile),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width - 80,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: searchToolBarColor,
                    ),
                    child: MaterialButton(
                      //color: kBtnBgColor,
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                        child: Text(
                          "Cancle",
                          style: btnTxtStyle,
                        ),
                      ),
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProfileUi(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
