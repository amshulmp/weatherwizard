import 'package:flutter/material.dart';

ThemeData lightmode=ThemeData(
  colorScheme: ColorScheme.light(
    background:Colors.white,
     primary:Colors.grey.shade500,
      secondary:Colors.grey.shade200,
       inversePrimary:Colors.grey.shade900,
       tertiary: Colors.black,
       onTertiary: Colors.blue.shade400,
       inverseSurface: Colors.black,

  )
);

ThemeData darkmode=ThemeData(
  colorScheme: ColorScheme.dark(
    background:Colors.grey.shade900,
     primary:Colors.grey.shade600,
      secondary:Colors.grey.shade800,
       inversePrimary:Colors.grey.shade300,
            tertiary: Colors.white,
            onTertiary: Colors.blue.shade400,
             inverseSurface: Colors.black,
  )
);