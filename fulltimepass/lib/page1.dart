import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';
import 'package:vibration/vibration.dart';

//a safe vault like audio for passwords
// it encript you password
//my password genrator vault
//current time will be password

class One extends StatefulWidget {
  @override
  _OneState createState() => _OneState();
}

class _OneState extends State<One> {
  int Number = Random().nextInt(100);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: height / 15,
            ),
            Text(
              'Your lucky Number is',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'VR',
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: height / 30,
            ),
            GestureDetector(
              onLongPress: () {
                Navigator.pushNamed(context, '/vaultLogin');
              },
              child: Text(
                '$Number',
                style: TextStyle(
                    fontSize: 60,
                    fontFamily: 'VR',
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            LottieBuilder.network(
                'https://assets8.lottiefiles.com/packages/lf20_jhaabiai.json'),
            // Container(
            //   child: Expanded(child: SvgPicture.asset("assets/2.svg")),
            //   height: 300,
            // ),
            SizedBox(
              height: height / 4,
            ),
            Hero(
              tag: 'Button',
              child: TextButton(
                onPressed: () {
                  //Vibration.vibrate();
                  setState(() {
                    Number = Random().nextInt(100);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "Boom",
                    style: TextStyle(fontSize: 35, fontFamily: 'VR'),
                  ),
                ),
                style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
