import 'package:flutter/material.dart';
import 'package:uae_gold_rates/screens/table_screen.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:uae_gold_rates/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      theme: FlexThemeData.light(scheme: FlexScheme.green),
        // The Mandy red, dark theme.
        darkTheme: FlexThemeData.dark(scheme: FlexScheme.green,appBarBackground: FlexColor.greenLightPrimary),
        // Use dark or light theme based on system setting.
        themeMode: ThemeMode.system,
      home:  TableScreen(),
    );
  }
}

