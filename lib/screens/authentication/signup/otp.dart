import 'package:app/screens/authentication/signup/verified.dart';
import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SignupOtp extends StatefulWidget {
  const SignupOtp({Key? key}) : super(key: key);

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
                  await AuthService().verifyOtp(value);
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
