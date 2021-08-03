import 'package:app/screens/authentication/signup/otp.dart';
import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool _loading = false;
  final _formKey = GlobalKey<FormState>();
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
      body: _loading
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textScaleFactor: 1,
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                          controller: name,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            hintText: "Email/Phone",
                            hintStyle: GoogleFonts.ptSans(
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          )),
                      SizedBox(height: 15),
                      Text(
                        'Phone Number',
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textScaleFactor: 1,
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: phone,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            hintText: "Email/Phone",
                            hintStyle: GoogleFonts.ptSans(
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          )),
                      SizedBox(height: 15),
                      Text(
                        'Email Id',
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textScaleFactor: 1,
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: email,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            hintText: "Email/Phone",
                            hintStyle: GoogleFonts.ptSans(
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          )),
                      SizedBox(height: 15),
                      Text(
                        'Password',
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textScaleFactor: 1,
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                          controller: password,
                          validator: (value) {
                            String pattern =
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                            RegExp regExp = new RegExp(pattern);
                            return regExp.hasMatch(value!)
                                ? null
                                : "Does not meet password requirement";
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            hintText: "Email/Phone",
                            hintStyle: GoogleFonts.ptSans(
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          )),
                      SizedBox(height: 15),
                      Text(
                        'Re-Enter Password',
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textScaleFactor: 1,
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                          controller: reEnterPassword,
                          validator: (value) {
                            if (password.text == reEnterPassword.text)
                              return null;
                            else
                              return 'Password does not match';
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            hintText: "Email/Phone",
                            hintStyle: GoogleFonts.ptSans(
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          )),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 18),
                        child: MaterialButton(
                          color: Theme.of(context).primaryColor,
                          minWidth: double.infinity,
                          height: 50,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "Submit",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            textScaleFactor: 1,
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _loading = true;
                              });
                              await AuthService().sendOtp(phone.text);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SignupOtp(email.text,
                                          password.text, name.text)));
                              setState(() {
                                _loading = false;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
