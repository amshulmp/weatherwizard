import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Time extends StatelessWidget {
 final dynamic clockStream;
  const Time({super.key,required this.clockStream});
  
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<DateTime>(
            stream: clockStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  DateFormat('EE H:mm').format(snapshot.data!),
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                  ),
                );
              } else {
                return Text(
                  'Loading...',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                  ),
                );
              }
            },
          );
  }
}