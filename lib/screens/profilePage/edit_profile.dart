import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.all(80),
          child: Text(
            "Edit Profile",
            style: GoogleFonts.roboto(
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
            textScaleFactor: 1,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              SvgPicture.asset(
                'assets/s2.svg',
                width: 200,
                height: 200,
                color: Colors.teal[200],
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textScaleFactor: 1,
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        labelText: "Name",
                        labelStyle: GoogleFonts.ptSans(
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // Text(
                    //   "Email Id",
                    //   style: GoogleFonts.roboto(
                    //     fontSize: 16,
                    //     color: Colors.black,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    //   textScaleFactor: 1,
                    // ),
                    // SizedBox(height: 8),
                    // TextField(
                    //   decoration: InputDecoration(
                    //     labelText: "a***********@gmail.com",
                    //     labelStyle: GoogleFonts.ptSans(
                    //       fontSize: 13,
                    //       color: Colors.black54,
                    //     ),
                    //     enabledBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(color: Colors.teal),
                    //       borderRadius: BorderRadius.circular(8),
                    //     ),
                    //   ),
                    //   maxLines: 1,
                    // ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    // Text(
                    //   "Phone Number",
                    //   style: GoogleFonts.roboto(
                    //     fontSize: 16,
                    //     color: Colors.black,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    //   textScaleFactor: 1,
                    // ),
                    // SizedBox(height: 8),
                    // TextField(
                    //   decoration: InputDecoration(
                    //     labelText: "**********",
                    //     labelStyle: GoogleFonts.ptSans(
                    //       fontSize: 13,
                    //       color: Colors.black54,
                    //     ),
                    //     enabledBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(color: Colors.teal),
                    //       borderRadius: BorderRadius.circular(8),
                    //     ),
                    //   ),
                    //   maxLines: 1,
                    // ),
                  ],
                ),
              ),
              SizedBox(height: 0),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 53,
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Save",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    textScaleFactor: 1,
                  ),
                  onPressed: () async {
                    var _auth = auth.FirebaseAuth.instance;
                    await _auth.currentUser!.updateDisplayName(controller.text);
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
