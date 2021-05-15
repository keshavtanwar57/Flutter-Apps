import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'constant.dart';

class VaultLogin extends StatefulWidget {
  @override
  _VaultLoginState createState() => _VaultLoginState();
}

class _VaultLoginState extends State<VaultLogin> {
  String key = "";
  String time = "";
  String hour = "";
  String min = "";
  @override
  Widget build(BuildContext context) {
    var datetime = DateTime.now();
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: h / 20,
              ),
              Text(
                'Enter your Key',
                style: kHeadingStyle,
              ),
              Lottie.network(
                  'https://assets8.lottiefiles.com/temp/lf20_Jy8wQr.json'),
              TextField(
                  autofocus: true,
                  obscureText: true,
                  onChanged: (text) {
                    key = text.toString();
                    min = datetime.minute.toString();
                    min.length != 2 ? min = '0' + min : null;
                    hour = datetime.hour.toString();
                    time = hour + min;
                    key == time
                        ? Navigator.pushNamed(context, '/vault')
                        : print("wrong pass");
                    setState(() {
                      print('state set');
                    });
                  },
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'VR', fontSize: 20),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

/*
//'https://assets6.lottiefiles.com/packages/lf20_borkvxlu.json'),
https://assets2.lottiefiles.com/packages/lf20_ndjggbxg.json
https://assets2.lottiefiles.com/packages/lf20_x6wwkwp2.json
https://assets2.lottiefiles.com/packages/lf20_zcg2skbo.json
*/
