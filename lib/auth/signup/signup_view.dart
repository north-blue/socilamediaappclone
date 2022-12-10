import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_validator/form_validator.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socilamedia_one_flutter/auth/login/login_view.dart';
import 'package:socilamedia_one_flutter/base/bottom_nav/bottom_nav.dart';
import 'package:socilamedia_one_flutter/constant/constant.dart';
import 'package:socilamedia_one_flutter/pages/home/home_screen.dart';

import 'package:socilamedia_one_flutter/widget/text_input_widget.dart';

import 'package:socilamedia_one_flutter/model/user.dart' as model;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  var isLoading = false;

  final TextEditingController emailSignupTextEditingController =
      TextEditingController();
  final TextEditingController passwordSignupTextEditingController =
      TextEditingController();
  final TextEditingController usernameSignupTextEditingController =
      TextEditingController();

  final _emailValidator = ValidationBuilder().email().minLength(8).build();
  final _passwordValidator = ValidationBuilder().minLength(6).build();

 


  void registerUser(String username, String email, String password) async {
    try {
      if (username.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
        
        UserCredential credential =
            await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

      

        model.User user = model.User(
            email: email,
            uid: credential.user!.uid,
            profilePhoto: credential.user!.uid, //try
            bio: credential.user!.uid, //check if error edit screen

            username: username);

       
        firestore
            .collection('users')
            .doc(credential.user!.uid)
            .set(user.toJson());


             setState(() {
          isLoading = false;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  BottomNavPage()),
          );
        });
      } else {
        const snackbar = SnackBar(
            content: Text('Error Creating Account.Please enter all fields'));
      }
    } catch (e) {
      SnackBar snackbar = SnackBar(content: Text('Error Creating Account'));
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
                  Text('Create New\nAccount',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.hammersmithOne(
                        fontSize: 50,
                        fontWeight: FontWeight.w300,
                        color: titleTextColor,
                      )),

                  const SizedBox(
                    height: 25,
                  ),

                

                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already Registered?',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: titleTextColor,
                        ),
                      ),
                     
                      InkWell(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        )),
                        child: Text(
                          '  Log in here',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: ifelseTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextInputClass(
                            textEditingController:
                                emailSignupTextEditingController,
                            hintText: 'email',
                            labelText: 'email',
                            icon: Icons.email,
                            validator: _emailValidator,
                            isObsure: false,
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextInputClass(
                            textEditingController:
                                usernameSignupTextEditingController,
                            hintText: 'username',
                            labelText: 'username',
                            icon: Icons.person,
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
                          child: TextInputClass(
                            textEditingController:
                                passwordSignupTextEditingController,
                            hintText: 'password',
                            labelText: 'password',
                            icon: Icons.lock,
                            validator: _passwordValidator,
                            isObsure: true,
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        if (isLoading) const CircularProgressIndicator(),
                        if (!isLoading)
                          Container(
                            width: MediaQuery.of(context).size.width - 40,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: searchToolBarColor,
                            ),
                            child: MaterialButton(
                              elevation: 10.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Center(
                                child: Text(
                                  "Sign up",
                                  style: btnTxtStyle,
                                ),
                              ),
                              onPressed: () {
                                registerUser(
                                  usernameSignupTextEditingController.text,
                                  emailSignupTextEditingController.text,
                                  passwordSignupTextEditingController.text,
                                );
                              },
                            ),
                          ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
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
