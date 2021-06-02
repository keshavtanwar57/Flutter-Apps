import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geu_trial_1/Components/constants.dart';
import 'LoginScreen.dart';



class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF1e2ede),
      ),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Container(
            height: h,
            width: w,
            color: Color(0xFF1e2ede),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Welcome",
                  style: kheadingStyle,
                ),
                Lottie.network(
                    "https://assets8.lottiefiles.com/packages/lf20_K7aZUG.json"),
                FlatButton(
                    onPressed: (){
                      setState(() {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      });
                    },
                    splashColor: Color(0xFF1e2ede),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                    color: Color(0xFF84d2f6),
                    child: Container(
                      height: h/15,
                      width: w/4,
                      child: Center(
                        child: Lottie.network("https://assets3.lottiefiles.com/datafiles/HEn1mxqsZRkB1F0/data.json"),
                      ),
                    ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
