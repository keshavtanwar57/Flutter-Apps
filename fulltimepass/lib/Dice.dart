import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'constant.dart';
import 'dart:math';

class Dice extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int Number = Random().nextInt(10);
  String dicee = '';
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Color(0xFF5352ED),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: h / 20,
                ),
                Text(
                  'Dicee',
                  style: kHeadingStyle,
                ),
                GestureDetector(
                  onLongPress: () {
                    Navigator.pushNamed(context, '/vaultLogin');
                  },
                  child: Lottie.network(
                      'https://assets4.lottiefiles.com/packages/lf20_VnhOCi.json'),
                ),
                SizedBox(height: h / 40),
                Text(
                  dicee,
                  style: kHeadingStyle,
                ),
                SizedBox(height: h / 10),
                TextButton(
                  onPressed: () {
                    setState(() {
                      Number = Random().nextInt(6) + 1;
                      dicee = Number.toString();
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Roll',
                      style: TextStyle(fontSize: 30, fontFamily: 'VR'),
                    ),
                  ),
                  style: TextButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
