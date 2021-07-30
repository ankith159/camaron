import 'package:app/screens/authentication/signup/signup_form.dart';
import 'package:app/screens/home/home_page.dart';
import 'package:auth/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: ListView(
            padding: EdgeInsets.all(20),
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/logo.png',
                height: 150,
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email or Phone Number",
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textScaleFactor: 1,
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: _username,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText: "Email/Phone",
                        hintStyle: GoogleFonts.ptSans(
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      maxLines: 1,
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Password",
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textScaleFactor: 1,
                    ),
                    SizedBox(height: 8),
                    TextField(
                      obscureText: true,
                      controller: _password,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText: "Password",
                        hintStyle: GoogleFonts.ptSans(
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40, right: 18),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  child: InkWell(
                    child: Text(
                      "Forget Password?",
                      textAlign: TextAlign.end,
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        color: Theme.of(context).primaryColor,
                      ),
                      textScaleFactor: 1,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18, right: 18, left: 18),
                child: MaterialButton(
                  color: Theme.of(context).primaryColor,
                  minWidth: double.infinity,
                  height: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    textScaleFactor: 1,
                  ),
                  onPressed: () async {
                    await AuthService()
                        .emailPassSignIn(_username.text, _password.text);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupForm(),
                      ),
                    );
                  },
                  child: RichText(
                    textAlign: TextAlign.end,
                    text: TextSpan(
                      text: "Don't have an account ? ",
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        color: Colors.black54,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "SignUp",
                          style: GoogleFonts.roboto(
                            fontSize: 15,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
