import 'package:app/screens/authentication/signup/verified.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

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
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              Image.asset('assets/phone.png'),
              PinCodeTextField(
                appContext: context,
                length: 6,
                onChanged: (value) {},
                onCompleted: (value) async {
                  var credential = await AuthService().verifyOtp(value);
                  if (credential.smsCode == value) {
                    await AuthService()
                        .registerEmailPass(widget.email, widget.password);
                    await AuthService().linkCredential(credential);
                  }

                  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
                  _auth.currentUser!.updateDisplayName(widget.name);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => VerifiedScreen()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
