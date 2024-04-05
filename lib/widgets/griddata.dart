import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class GridData extends StatelessWidget {
  final dynamic temperaturemin;
  final dynamic wind;
  final dynamic humidity;
  final dynamic temperatuemax;
  final dynamic feelslike;
  final dynamic sealevel;
  
  const GridData({super.key,required this.temperaturemin,required this.wind,required this.humidity,required this.temperatuemax,required this.feelslike,required this.sealevel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Grid(text: "temperature min", subtext: "$temperaturemin°C", icon: Icons.thermostat),
               Grid(text: "temperature max", subtext: "$temperatuemax°C", icon: Icons.thermostat),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
             Grid(text: "wind", subtext: "$wind km/h", icon: Icons.wind_power),
              Grid(text: "humidity", subtext: "$humidity%", icon: Icons.water_drop),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Grid(text: "sea level", subtext: "$sealevel", icon: Icons.water),
              Grid(text: "feels like", subtext: "$feelslike°C", icon: Icons.thermostat),
            ],
          )
        ],
      ),
    );
  }
}

class Grid extends StatelessWidget {
  final dynamic text;
  final dynamic subtext;
  final dynamic icon;
  const Grid(
      {super.key,
      required this.text,
      required this.subtext,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(18)),
      width: MediaQuery.of(context).size.width * 0.48,
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              icon,
              color: Theme.of(context).colorScheme.inverseSurface,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  text,
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                  ),
                ),
               Text(
                  subtext,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Theme.of(context).colorScheme.inverseSurface,
                      fontSize: MediaQuery.of(context).size.width * 0.047,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
