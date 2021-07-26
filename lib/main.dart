import 'package:app/screens/authentication/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: Wrapper()));
}

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<LoginUser?>.value(
      value: AuthService().fireUser,
      builder: (context, child) {
        final loginuser = Provider.of<LoginUser?>(context);

        if (loginuser == null) {
          return LoginScreen();
        } else {
          return HomePage();
        }
      },
      initialData: null,
    );
  }
}
