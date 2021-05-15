import 'package:flutter/material.dart';
import 'Home.dart';
import 'page1.dart';
import 'vaultLogin.dart';
import 'vault.dart';
import 'flip.dart';
import 'timepassMenu.dart';
import 'Dice.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';



void main() {
  runApp(MyApp());
}

SharedPreferences prefs;
Future init() async {
  prefs = await SharedPreferences.getInstance();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      initialRoute: '/',
      routes: {
        '/timepassmenu': (context) => TimepassMenu(),
        '/Dice': (context) => Dice(),
        '/coin': (context) => Coin(),
        '/': (context) => Home(),
        '/LuckyNumber': (context) => One(),
        '/vaultLogin': (context) => VaultLogin(),
        '/vault': (context) => Vault()
      },
    );
  }
}
