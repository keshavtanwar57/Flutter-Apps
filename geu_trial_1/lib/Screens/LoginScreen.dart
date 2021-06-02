import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geu_trial_1/Screens/HomeScreen.dart';
import 'package:lottie/lottie.dart';
import 'package:geu_trial_1/Components/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  String verificationId;

  bool showLoading = false;

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
      await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if(authCredential?.user != null){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
      }

    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  getMobileFormWidget(context) {
    return SafeArea(
      child: Container(
        color: Color(0xFF1e2ede),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Text("Verify your Number",style: kheadingStyle,),
            SizedBox(height: 15,),
            Lottie.network("https://assets10.lottiefiles.com/private_files/lf30_RA6DSR.json"),
            SizedBox(height: 15,),
            TextField(
              keyboardType: TextInputType.phone,
              controller: phoneController,
              decoration: InputDecoration(
                suffix: Icon(Icons.phone),
                hintText: "Phone Number",
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green),borderRadius: BorderRadius.all(Radius.circular(20)),)
              ),
            ),
            SizedBox(
              height: 16,
            ),

            FlatButton(
              onPressed: () async {
                setState(() {
                  showLoading = true;
                });

                await _auth.verifyPhoneNumber(
                  phoneNumber: phoneController.text,
                  verificationCompleted: (phoneAuthCredential) async {
                    setState(() {
                      showLoading = false;
                    });
                    //signInWithPhoneAuthCredential(phoneAuthCredential);
                  },
                  verificationFailed: (verificationFailed) async {
                    setState(() {
                      showLoading = false;
                    });
                    _scaffoldKey.currentState.showSnackBar(
                        SnackBar(content: Text(verificationFailed.message)));
                  },
                  codeSent: (verificationId, resendingToken) async {
                    setState(() {
                      showLoading = false;
                      currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
                      this.verificationId = verificationId;
                    });
                  },
                  codeAutoRetrievalTimeout: (verificationId) async {},
                );
              },
              child: Text("SEND"),
              color: Colors.blue,
              textColor: Colors.white,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  getOtpFormWidget(context) {
    return Container(
      color: Color(0xFF1e2ede),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          Spacer(),
          Text("Enter OTP",style: kheadingStyle,),
          Lottie.network("https://assets1.lottiefiles.com/packages/lf20_85jUo8.json"),
          TextField(
            keyboardType: TextInputType.phone,
            controller: otpController,
            decoration: InputDecoration(
              hintText: "Enter OTP",
            ),
          ),
          SizedBox(
            height: 16,
          ),
          FlatButton(
            onPressed: () async {
              PhoneAuthCredential phoneAuthCredential =
              PhoneAuthProvider.credential(
                  verificationId: verificationId, smsCode: otpController.text);
              signInWithPhoneAuthCredential(phoneAuthCredential);
            },
            child: Text("VERIFY"),
            color: Colors.blue,
            textColor: Colors.white,
          ),
          Spacer(),
        ],
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        body: Center(
          child: Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Color(0xFF1e2ede),
              child: showLoading
                  ? Center(
                child: Lottie.network("https://assets10.lottiefiles.com/private_files/lf30_kanwuonz.json"),
              )
                  : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                  ? getMobileFormWidget(context)
                  : getOtpFormWidget(context),
              padding: const EdgeInsets.all(16),
            ),
          ),
        ));
  }
}