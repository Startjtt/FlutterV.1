import 'package:flutter/material.dart';
import 'package:flutter_app2/utils/constants.dart';
import 'package:flutter_app2/pages/login/login_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      theme:  ThemeData(primarySwatch: Colors.blue,  scaffoldBackgroundColor: Colors.white),
      home: LoginPage(),
    );
  }
}
