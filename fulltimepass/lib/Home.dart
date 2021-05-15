import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'constant.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF5352ED),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height / 30),
              Text(
                "Welcome 👋",
                style: TextStyle(
                    fontSize: 30, color: Colors.white, fontFamily: 'VR'),
              ),
              Text(
                "to the",
                style: TextStyle(
                    fontSize: 30, color: Colors.white, fontFamily: 'VR'),
              ),
              SizedBox(height: height / 50),
              Text(
                "Timepass App !",
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'VR'),
              ),
              Container(
                height: height/3,
                  child: LottieBuilder.network('https://assets8.lottiefiles.com/packages/lf20_t0mvxlwu.json')),
              SizedBox(
                height: height/10,
              ),
              Center(
                child: MyButton(
                  path: '/timepassmenu',
                  txt: 'Timepass',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
