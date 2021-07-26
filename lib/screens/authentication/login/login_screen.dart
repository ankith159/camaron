import 'package:app/screens/authentication/signup/signup_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              Image.asset('assets/logo.png'),
              Text('Email Id or Phone Number'),
              TextField(),
              Text('Password'),
              TextField(),
              Text(
                'Forgot Password?',
                textAlign: TextAlign.end,
              ),
              Container(
                width: double.maxFinite,
                child: TextButton(onPressed: () {}, child: Text('Login')),
              ),
              Row(
                children: [
                  Text('Don\'t have an account?'),
                  InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SignupForm()));
                      },
                      child: Text(' Signup'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
