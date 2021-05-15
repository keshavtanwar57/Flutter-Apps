import 'package:flutter/material.dart';
import 'constant.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';

// use enums

class Coin extends StatefulWidget {
  @override
  _CoinState createState() => _CoinState();
}

class _CoinState extends State<Coin> {
  int Number = Random().nextInt(10);
  String toss = '';
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF5352ED),
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
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: h / 20),
                Text(
                  'Flip a Coin',
                  style: kHeadingStyle,
                ),
                GestureDetector(
                  onLongPress: () {
                    Navigator.pushNamed(context, '/vaultLogin');
                  },
                  child: Lottie.network(
                      'https://assets4.lottiefiles.com/temp/lf20_pO3t5Q.json'),
                ),
                SizedBox(
                  height: h / 20,
                ),
                Text(
                  toss,
                  style: kHeadingStyle,
                ),
                SizedBox(
                  height: h / 13,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      Number = Random().nextInt(10);
                      Number % 2 == 0 ? toss = 'Head' : toss = 'Tail';
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Toss',
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
            )),
      ),
    );
  }
}

//https://assets4.lottiefiles.com/temp/lf20_zBfmHv.json
