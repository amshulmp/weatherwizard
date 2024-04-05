// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherwizard/utilities/routes.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
  
    Navigator.pushReplacementNamed(context, Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.6,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Lottie.asset("assets/Animation - 1708162577473.json"),
                    ),
                    
                    Text(
                      "Weather Wizard",
                      style:  GoogleFonts.lato(
                      textStyle:  GoogleFonts.nunito(
                      textStyle: TextStyle(
                        fontWeight:FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.054,
                      ),
                    ),
                    ),
                    )
                  ],
                ),
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
