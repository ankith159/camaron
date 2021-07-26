import 'package:app/main.dart';
import 'package:flutter/material.dart';

class VerifiedScreen extends StatelessWidget {
  const VerifiedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (_) => Wrapper()), (route) => false);
          },
          child: Text('Back to Login'),
        ),
      ),
    );
  }
}
