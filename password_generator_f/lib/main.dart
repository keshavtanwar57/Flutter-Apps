import 'package:flutter/material.dart';
import 'package:password_generator_f/Verify.dart';
import 'Home.dart';
import 'package:local_auth/local_auth.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff7F2CCB),
      ),

      home: Verify(),
    );
  }
}
