import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  final dynamic size;
  final dynamic text;
  const TextWidget({super.key,required this.size,required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
                  text,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: MediaQuery.of(context).size.width * size,
                    ),
                  ),
                );
  }
}