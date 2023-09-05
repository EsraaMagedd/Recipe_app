import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:home_screen/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Color _color = Color(0xfff94a0c);
  Text _text1 = Text("Yummy",style: GoogleFonts.lobster(textStyle: TextStyle(color: Colors.white),fontSize: 70));
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      _color = Colors.white;
      _text1 = Text("Yummy",style: GoogleFonts.lobster(textStyle: TextStyle(color: Color(0xfff94a0c)),fontSize: 70));
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _color,
        body: Center(
          child: Container(
            height: 250,
            width: 250,
            child:_text1,
          ),
        )
    );
  }
}
