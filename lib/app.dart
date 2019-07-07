import 'package:flutter/material.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kik',
      theme: ThemeData(

        primarySwatch: Color.fromRGBO(9, 80, 120, 1),
      ),
    );
  }

}