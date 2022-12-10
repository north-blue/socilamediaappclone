// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socilamedia_one_flutter/constant/constant.dart';



class TextInputClass extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController textEditingController;
  final bool isObsure;
  final IconData icon;

  // final TextInputType? keyboardType;   //try

  String? Function(String?)? validator;

  //final ValueChanged<String> onSubmit;

  TextInputClass({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.textEditingController,
    required this.isObsure,
    required this.icon,
    //required this.keyboardType,
    this.validator, required TextInputType keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          //borderRadius: BorderRadius.circular(15),
          boxShadow: [buildBoxShadow()]),
      child: TextFormField(
        controller: textEditingController,
        obscureText: isObsure,
        validator: validator,

        // keyboardType: keyboardType,
        decoration: InputDecoration(
          filled: true, //look

          prefixIcon: Icon(icon),
          hintText: hintText,
          hintStyle: const TextStyle(color: hintColor),
          labelText: labelText,
          labelStyle: GoogleFonts.playfairDisplay(
            //add style here
            fontSize: 15,
          ),

          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: const BorderSide(
                color: smallTextColor,
              )),

          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: const BorderSide(
                color: smallTextColor,
              )),
        ),
      ),
    );
  }

  BoxShadow buildBoxShadow() {
    return BoxShadow(
      color: const Color.fromARGB(255, 207, 206, 206).withOpacity(0.2),
      blurRadius: 20,
      spreadRadius: 3,
      offset: const Offset(0, 15),
    );
  }
}
