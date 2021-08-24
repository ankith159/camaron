import 'package:app/screens/authentication/login/login_screen.dart';
import 'package:app/screens/tab_page.dart';
import 'package:app/static_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth.dart';
import 'user.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var app = await Firebase.initializeApp();
  StaticData.app = app;
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(
    MaterialApp(
      home: Wrapper(),
      theme: ThemeData(
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Color(0xff3ed5d5),
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black54,
          ),
          appBarTheme: AppBarTheme(color: Color(0xff3ed5d5)),
          buttonColor: Color(0xff3ed5d5),
          primaryColor: Color(0xff3ed5d5),
          buttonTheme: ButtonThemeData(buttonColor: Color(0xff3ed5d5)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Color(0xff3ed5d5)),
                  backgroundColor:
                      MaterialStateProperty.all(Color(0xff3ed5d5))))),
    ),
  );
}

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  void initState() {
    super.initState();
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      // if (message != null) {
      //   Navigator.pushNamed(context, '/message',
      //       arguments: MessageArguments(message, true));
      // }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // RemoteNotification notification = message.notification!;
      // AndroidNotification android = message.notification!.android!;

      // if (notification != null && android != null) {}
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      // Navigator.pushNamed(context, '/message',
      //     arguments: MessageArguments(message, true));
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<LoginUser?>.value(
      value: AuthService().fireUser,
      builder: (context, child) {
        final loginuser = Provider.of<LoginUser?>(context);

        if (loginuser == null) {
          return LoginScreen();
        } else {
          return TabPage();
        }
      },
      initialData: null,
    );
  }
}
