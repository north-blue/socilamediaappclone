import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socilamedia_one_flutter/auth/signup/signup_view.dart';
import 'package:socilamedia_one_flutter/constant/constant.dart';


import 'package:socilamedia_one_flutter/widget/text_input_widget.dart';

import '../../base/bottom_nav/bottom_nav.dart';





class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var isLoading = false;

  final TextEditingController emailLoginTextEditingController =
      TextEditingController();
  final TextEditingController passwordLoginTextEditingController =
      TextEditingController();

  final _emailValidatorLogin = ValidationBuilder().email().minLength(8).build();
  final _passwordValidatorLogin = ValidationBuilder().minLength(6).build();


  loginForm(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() {
          isLoading = true;
        });
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        setState(() {
          isLoading = false;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  BottomNavPage()),
          );
        });
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          e.code,
          textAlign: TextAlign.center,
        )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
         alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Text('LOGIN',
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
                          'No Account?',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: titleTextColor,
                          ),
                        ),
                        //wrap with widget then add inkwell to it

                        InkWell(
                          onTap: () => Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          )),
                          child: Text(
                            '  Sign Up here',
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
                                 emailLoginTextEditingController,
                              hintText: 'email',
                              labelText: 'email',
                              icon: Icons.email,
                              validator: _emailValidatorLogin,
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
                                 passwordLoginTextEditingController,
                              hintText: 'password',
                              labelText: 'password',
                              icon: Icons.lock,
                              validator: _passwordValidatorLogin,
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
                                height: 57,
                                color: btnBgColor,
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
                                 loginForm(emailLoginTextEditingController.text,
                                      passwordLoginTextEditingController.text);
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
