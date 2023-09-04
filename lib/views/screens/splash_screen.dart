import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/');
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("MyQu",
                  style: GoogleFonts.aBeeZee(
                      color: Color(0xff09203F), fontSize: 30, letterSpacing: 1)),
              const SizedBox(
                width: 2,
              ),
              const Icon(
                Icons.all_inclusive,
                size: 50,
                color: Color(0xff09203F),
              ),
              const SizedBox(
                width: 2,
              ),
              Text("tes",
                  style: GoogleFonts.aBeeZee(
                      color: Color(0xff09203F), fontSize: 30, letterSpacing: 1)),
            ],
          ),
        ),
      ),
    );
  }
}

// Color(0xff537895);
