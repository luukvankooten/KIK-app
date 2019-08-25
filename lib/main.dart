import 'package:flutter/material.dart';
import 'package:kik/theme.dart';
import 'package:kik/views/home.dart';
import 'package:kik/routes.dart';

void main() => runApp(Kik());

class Kik extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kik',
      theme: ThemeData(
          fontFamily: 'OpenSans',
          primarySwatch: ThemeColor.blue
      ),
      home: Home(),
      routes: routes,
    );
  }
}