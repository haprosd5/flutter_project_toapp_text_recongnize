import 'package:flutter/material.dart';
import 'package:projecttodoapp/helper/constants.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: kPrimaryMainColor,
        primaryColor: kPrimaryMainColor,
        accentColor: kAccendMainColor,
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.white,
          brightness: Brightness.light,
          actionsIconTheme: IconThemeData(color: kTextPrimarySubColor),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
      debugShowCheckedModeBanner: false,

      home: HomeScreen(),
    );
  }
}
