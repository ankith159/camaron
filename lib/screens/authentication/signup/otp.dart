import 'package:app/auth.dart';
import 'package:app/screens/authentication/signup/verified.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../main.dart';

class SignupOtp extends StatefulWidget {
  final email;
  final password;
  final name;
  SignupOtp(this.email, this.password, this.name);

  @override
  _SignupOtpState createState() => _SignupOtpState();
}

class _SignupOtpState extends State<SignupOtp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/phone.png',
                height: 200,
              ),
              SizedBox(
                height: 20,
              ),
              Text('Enter OTP'),
              SizedBox(
                height: 20,
              ),
              PinCodeTextField(
                appContext: context,
                length: 6,
                onChanged: (value) {},
                onCompleted: (value) async {
                  var credential = await AuthService().verifyOtp(value);
                  if (credential.smsCode == value) {
                    await AuthService()
                        .registerEmailPass(widget.email, widget.password);
                    try {
                      await AuthService().linkCredential(credential);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Acc already exists')));
                      Navigator.pop(context);
                    }
                  }

                  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
                  _auth.currentUser!.updateDisplayName(widget.name);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Wrapper()),
                      (route) => false);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
