import 'package:flutter/material.dart';
import 'constant.dart';
import 'package:lottie/lottie.dart';

class TimepassMenu extends StatefulWidget {
  @override
  _TimepassMenuState createState() => _TimepassMenuState();
}

class _TimepassMenuState extends State<TimepassMenu> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xFF5352ED),
      //   title: Text(
      //     'Have Fun',
      //     style: TextStyle(color: Colors.white, fontFamily: 'VR', fontSize: 25),
      //   ),
      //   centerTitle: true,
      // ),
      backgroundColor: Color(0xFF5352ED),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: height / 20),
                  Text(
                    'Choose one',
                    style: TextStyle(
                        fontFamily: 'VR', color: Colors.white, fontSize: 30),
                  ),
                  LottieBuilder.network(
                      'https://assets8.lottiefiles.com/packages/lf20_GEMjGg.json'),
                  SizedBox(height: height / 28),
                  MyButton(
                    txt: 'Lucky Number',
                    color: Colors.white70,
                    path: '/LuckyNumber',
                  ),
                  SizedBox(height: height / 28),
                  MyButton(
                    txt: 'Toss',
                    color: Colors.white70,
                    path: '/coin',
                  ),
                  SizedBox(height: height / 28),
                  MyButton(
                    txt: 'Roll a Dice',
                    color: Colors.white70,
                    path: '/Dice',
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
