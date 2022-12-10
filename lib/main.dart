import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:socilamedia_one_flutter/auth/signup/signup_view.dart';
import 'package:socilamedia_one_flutter/base/bottom_nav/bottom_nav.dart';

import 'package:socilamedia_one_flutter/pages/home/home_screen.dart';
import 'package:socilamedia_one_flutter/pages/editprofile/edit_profile_screen.dart';

import 'package:socilamedia_one_flutter/splash/splash_screen.dart';

//for the default firebaseoptions

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, userSnapshot) {
            if (userSnapshot.connectionState == ConnectionState.waiting) {
              return SplashScreen();
            }
            if (userSnapshot.hasData) {
              return  BottomNavPage();

              //HomePage();    //after login it will show this page homepage
            }
            return SignUpScreen();
          }),
    );
  }
}
