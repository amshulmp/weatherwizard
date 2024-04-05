import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherwizard/screens/home.dart';
import 'package:weatherwizard/screens/mangecities.dart';
import 'package:weatherwizard/screens/splash.dart';
import 'package:weatherwizard/utilities/routes.dart';
import 'package:weatherwizard/utilities/sharedpreference.dart';
import 'package:weatherwizard/utilities/themeprovider.dart';
import 'package:weatherwizard/utilities/weatherservices.dart';

void main() async{
 WidgetsFlutterBinding.ensureInitialized();
  bool isDarkMode = await SharedPreferencesHelper.getmodeStatus();

  runApp(
  MultiProvider(providers: [
      ChangeNotifierProvider(
      create: (context) => Themeprovider(initialDarkMode: isDarkMode),),
      ChangeNotifierProvider(create:(context) => WeatherProvider(),)
  ],
   child: const MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      theme: Provider.of<Themeprovider>(context).themeData,
      routes: {
        Routes.splash: (context) => const Splash(),
        Routes.home: (context) => const Home(),
        Routes.city: (context) => const ManageCity(), 
      },
    );
  }
}
