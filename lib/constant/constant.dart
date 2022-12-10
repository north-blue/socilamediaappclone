import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';


//COLORS
//stackoverflow data
//color class only accepts intergers as parametert
//or there is the possibility to use the named constructors fromARGB and fromRGBO.
//255 (full) opacity is represented by the hexadecimal value FF. This already leaves us with 0xFF.
const backgroundColor = Color(0xFFf6f4f1);

const titleTextColor = Color(0xFF423e3a);
const ifelseTextColor = Color.fromARGB(255, 150, 160, 163);

const smallTextColor =
    Color(0xFF253439); //for border of textview and button color too

const hintColor = Color.fromARGB(255, 155, 148, 139);
const searchToolBarColor = Color(0xFFb29e84);

const storyBorder = [Color(0xFFb29e84), Color.fromARGB(255, 155, 148, 139)];

// FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;





const btnBgColor =Color(0xFFb29e84);
const btnTxtStyle = TextStyle(
    color: Colors.white,
    fontSize: 23,
    backgroundColor: Color(0xFFb29e84),
    fontWeight: FontWeight.bold,
    fontFamily: 'Raleway');
