import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherwizard/utilities/routes.dart';
import 'package:weatherwizard/utilities/weatherservices.dart';
import 'package:weatherwizard/widgets/griddata.dart';
import 'package:weatherwizard/widgets/textwidget.dart';
import 'package:weatherwizard/widgets/timewidget.dart';
import 'package:weatherwizard/widgets/toggleswitch.dart';
import 'package:weatherwizard/widgets/weatheranimation.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller=TextEditingController();
  Stream<DateTime> clockStream = Stream<DateTime>.periodic(
      const Duration(seconds: 1), (count) => DateTime.now());

  @override
  void initState() {
    super.initState();
    Provider.of<WeatherProvider>(context, listen: false).getCurrentLocation("");
  }
 
  @override
  Widget build(BuildContext context) {
    dynamic getLottie(String?condition) {
  if (condition == null) {
    return "assets/Animation - 1708162577473.json";
  }
  switch (condition.toLowerCase()) {
    case 'clouds':
      return "assets/Animation - 1708010269858.json";
    case 'mist':
    case 'smoke':
    case 'haze':
    case 'dust':
    case 'fog':
      return "assets/Animation - 1708010269858.json";
    case 'rain':
    case 'drizzle':
    case 'shower rain':
      return "assets/Animation - 1708010439599.json";
    case 'thunderstorm':
      return "assets/Animation - 1708010381405.json";
    case 'clear':
      return "assets/Animation - 1708162577473.json";
    default:
      return "assets/Animation - 1708162577473.json";
  }
}

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Consumer<WeatherProvider>(
        builder: (BuildContext context, WeatherProvider weatherProvider,
            Widget? child) {
          if (weatherProvider.data.temperature == 'loading') {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, Routes.city);
                        },
                        icon: Icon(
                          Icons.list,
                          color: Theme.of(context).colorScheme.tertiary,
                          size: MediaQuery.of(context).size.height * 0.04,
                        ),
                      ),
                      TextWidget(
                          size: 0.06, text: weatherProvider.data.city),
                      const ToggleSwitch(),
                    ],
                  ),
                ),
                Time(clockStream: clockStream),
                 WeatherAnimation(animation:getLottie( weatherProvider.data.weatherType)),
                Text(
                  weatherProvider.data.weatherType,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                  ),
                ),
                TextWidget(
                    size: 0.15,
                    text: "${weatherProvider.data.temperature.ceil()}°C"),
                GridData(
                  temperaturemin: "${weatherProvider.data.temperaturemin.ceil()}",
                  wind: "${weatherProvider.data.wind}",
                  humidity: 14,
                  temperatuemax: "${weatherProvider.data.temperatuemax.ceil()}",
                  feelslike: "${weatherProvider.data.feelslike.ceil()}",
                  sealevel: "${weatherProvider.data.sealevel}",
                ),
              ],
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showDialog(context: context, builder: (BuildContext context) { 
          return 
            AlertDialog(
      backgroundColor:Theme.of(context).colorScheme.secondary,
      content: SizedBox(
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextFormField(
              controller:controller ,
              decoration:  InputDecoration(
                filled: true,
                fillColor: Theme.of(context).colorScheme.background,
                hintText: "city name",
               border: InputBorder.none,
               errorBorder: InputBorder.none,
               disabledBorder: InputBorder.none,
               enabledBorder: InputBorder.none,
               focusedBorder: InputBorder.none,
               focusedErrorBorder: InputBorder.none,
              ),
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
               ElevatedButton(onPressed: (){
                Provider.of<WeatherProvider>(context, listen: false).getCurrentLocation(controller.text.trim());
                 Navigator.of(context).pop();
               }, child: Text("search")),
                ElevatedButton(onPressed: (){
                   Navigator.of(context).pop();
                }, child: Text("cancel")),
              ],
            )
          ],
        ),
      ),
    );
         }, );
      },
      child: Icon(Icons.search,color: Colors.black,),)
      ,
    );
  }
}
