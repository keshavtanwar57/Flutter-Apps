import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:local_auth/local_auth.dart';
import 'Home.dart';

class Verify extends StatefulWidget {
  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {

  final LocalAuthentication _localAuthentication = LocalAuthentication();
  String _message = "Not Authorized";

  Future<bool> checkingForBioMetrics() async {
    bool canCheckBiometrics = await _localAuthentication.canCheckBiometrics;
    print(canCheckBiometrics);
    return canCheckBiometrics;
  }
  Future<void> _authenticateMe() async {
// 8. this method opens a dialog for fingerprint authentication.
//    we do not need to create a dialog nut it popsup from device natively.
    bool authenticated = false;
    try {
      authenticated = await _localAuthentication.authenticateWithBiometrics(
        localizedReason: "Authenticate for Testing", // message for dialog
        useErrorDialogs: true, // show error in dialog
        stickyAuth: true, // native process
      );
      setState(() {
        _message = authenticated ? "Authorized" : "Not Authorized";
        _message == "Authorized" ?  Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        ) : null;
      });
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
  }

  @override
  void initState() {
// TODO: implement initState
    checkingForBioMetrics();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Center(child: Container(height:400,child: Lottie.network('https://assets8.lottiefiles.com/packages/lf20_7jnffdxl.json'))),
            SizedBox(height: 100,),
            Container(
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xff6200EE),
              ),
              child: TextButton(onPressed: _authenticateMe, child: Text(
                'Authenticate',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),),
            ),

          ],
        )
      ),
    );
  }
}

/*(){
_authenticateMe;
_message == "Authorized" ?  Navigator.push(
context,
MaterialPageRoute(builder: (context) => Home()),
) : null;
}*/

