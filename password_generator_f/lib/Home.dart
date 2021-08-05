import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:lottie/lottie.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {




  String pass = '';
  final textField = TextEditingController();
  String password = '';

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xff6200EE),
        title: Text(
          'Password Generator',
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              TextField(
                controller: textField,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter website',
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                height: h / 1.9,
                child: Lottie.network(
                    'https://assets4.lottiefiles.com/packages/lf20_sgnacf85.json'),
              ),
              Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xff6200EE),
                ),
                child: TextButton(
                  onPressed: () {

                    password = textField.text
                    password = password.replaceAll('p', '/');
                    password = password.replaceAll('p', 'k');
                    password = password.replaceAll('a', '(');
                    password = password.replaceAll('i', '12');
                    password = password.replaceAll('I', '+=');
                    print('password is $password');
                    setState(() {
                      if (textField.text == '') {
                        pass = 'Please Input a website';
                      } else {
                        pass = "Your Password is Generated";
                      }
                      textField.clear();

                    });
                  },
                  child: Text(
                    'Generate',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: h / 30),
              Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.grey.shade800,
                ),
                child: TextButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: password));
                      setState(() {
                        pass = 'Password Copied!';
                      });
                    },
                    child: Text(
                      'Copy Password',
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                    )),
              ),
              SizedBox(height: 10),
              Text(
                pass,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//https://assets4.lottiefiles.com/packages/lf20_7jnffdxl.json
