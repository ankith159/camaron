import 'package:app/screens/authentication/signup/otp.dart';
import 'package:auth/auth.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  static TextEditingController name = TextEditingController();
  String get getName => name.text;
  static TextEditingController phone = TextEditingController();
  String get getPhone => phone.text;
  static TextEditingController email = TextEditingController();
  String get getEmail => email.text;
  static TextEditingController password = TextEditingController();
  String get getPassword => password.text;
  static TextEditingController reEnterPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              Text('Name'),
              TextField(
                controller: name,
              ),
              Text('Phone Number'),
              TextField(
                controller: phone,
              ),
              Text('Email Id(optional)'),
              TextField(
                controller: email,
              ),
              Text('Password'),
              TextField(
                controller: password,
              ),
              Text('Re-Enter Password'),
              TextField(
                controller: reEnterPassword,
              ),
              Container(
                child: TextButton(
                  onPressed: () async {
                    await AuthService()
                        .registerEmailPass(email.text, password.text);
                    await AuthService().sendOtp(phone.text);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => SignupOtp()));
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
