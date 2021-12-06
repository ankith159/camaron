import 'package:app/screens/appDrawer/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:url_launcher/url_launcher.dart';
import 'edit_profile.dart';
import 'settings_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void launchWhatsapp({@required number, @required message}) async {
    String url = "whatsapp://send?phone=+919962938974&text=$message";
    await canLaunch(url) ? launch(url) : print("can't open whatsapp");
  }

  var _auth = auth.FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          "Profile",
          style: GoogleFonts.roboto(
              fontSize: 20, color: Colors.black87, fontWeight: FontWeight.bold),
          textScaleFactor: 1,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfile(),
                ),
              );
            },
            icon: Icon(Icons.edit),
            color: Colors.black,
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          contain(),
        ],
      ),
    );
  }

  Widget contain() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 130,
                width: 130,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 18, top: 50),
                      child: CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: _auth.currentUser!.photoURL != null
                              ? Image.network(_auth.currentUser!.photoURL!)
                              : Icon(
                                  Icons.person,
                                  size: 60,
                                ),
                        ),
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.topRight,
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(top: 50, right: 15),
                    //     child: IconButton(
                    //       onPressed: () {
                    //         Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //             builder: (context) => EditProfile(),
                    //           ),
                    //         );
                    //       },
                    //       icon: Icon(Icons.edit),
                    //       color: Colors.black,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 78, top: 70),
                            child: Text(
                              _auth.currentUser!.displayName ?? '',
                              style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                              textScaleFactor: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              _auth.currentUser!.email ?? '',
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                color: Colors.black87,
                              ),
                              maxLines: 1,
                              textScaleFactor: 1,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 40.0),
              //   child: IconButton(
              //     onPressed: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => EditProfile(),
              //         ),
              //       );
              //     },
              //     icon: Icon(Icons.edit),
              //     color: Colors.black,
              //   ),
              // ),
            ],
          ),
          SizedBox(height: 70),
          // GestureDetector(
          //   onTap: () async {
          //     //  var url = "${baseURL}91${msg['phone']}&text=${msg['messages']}";
          //     // print(url);
          //     // AndroidIntent intent = AndroidIntent(
          //     //     action: 'action_view',
          //     //     data: Uri.encodeFull(url),
          //     //    package: "com.whatsapp.w4b");
          //     // intent.launch();

          //     String url = "whatsapp://send?phone=+919493757509&text=hi";
          //     await canLaunch(url) ? launch(url) : print("can't open whatsapp");
          //     // launch('https://google.com');
          //   },
          //   child: Container(
          //     child: Text(
          //       "Book A Service",
          //       style: GoogleFonts.roboto(
          //         fontSize: 16,
          //         color: Colors.black,
          //       ),
          //     ),
          //     width: double.maxFinite,
          //     padding: EdgeInsets.only(top: 18, bottom: 18),
          //     decoration: BoxDecoration(
          //         image: DecorationImage(
          //           image: AssetImage(
          //             "assets/next.png",
          //           ),
          //           alignment: Alignment.topRight,
          //           fit: BoxFit.contain,
          //         ),
          //         // color: Theme.of(context).primaryColor,
          //         border: Border(
          //             bottom:
          //                 BorderSide(color: Theme.of(context).primaryColor))),
          //   ),
          // ),
          // SizedBox(height: 10),
          // GestureDetector(
          //   onTap: () async {
          //     String url = "whatsapp://send?phone=+919493757509&text=hi";
          //     await canLaunch(url) ? launch(url) : print("can't open whatsapp");
          //   },
          //   child: Container(
          //     child: Text(
          //       "Ask A Demo",
          //       style: GoogleFonts.roboto(
          //         fontSize: 16,
          //         color: Colors.black,
          //       ),
          //     ),
          //     width: double.maxFinite,
          //     padding: EdgeInsets.only(top: 18, bottom: 18),
          //     decoration: BoxDecoration(
          //         image: DecorationImage(
          //           image: AssetImage(
          //             "assets/next.png",
          //           ),
          //           alignment: Alignment.topRight,
          //           fit: BoxFit.contain,
          //         ),
          //         // color: Theme.of(context).primaryColor,
          //         border: Border(
          //             bottom:
          //                 BorderSide(color: Theme.of(context).primaryColor))),
          //   ),
          // ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () async {
              // launchWhatsapp(number: "+919493757509", message: "hey ankith");
              showBottomSheet(
                  context: context,
                  builder: (context) => Container(
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              onPressed: () {
                                launchWhatsapp(
                                    number: "+919962938974",
                                    message: "Support-Camaron");
                              },
                              icon: Icon(
                                Icons.share,
                                size: 30,
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  launch('mailto:info@robicrufarm.com');
                                },
                                icon: Icon(
                                  Icons.mail,
                                  size: 30,
                                )),
                          ],
                        ),
                      ));
            },
            child: Container(
              child: Text(
                "Support",
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              width: double.maxFinite,
              padding: EdgeInsets.only(top: 18, bottom: 18),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/next.png",
                    ),
                    alignment: Alignment.topRight,
                    fit: BoxFit.contain,
                  ),
                  // color: Theme.of(context).primaryColor,
                  border: Border(
                      bottom:
                          BorderSide(color: Theme.of(context).primaryColor))),
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingPage(),
                ),
              );
            },
            child: Container(
              child: Text(
                "Settings",
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              width: double.maxFinite,
              padding: EdgeInsets.only(top: 18, bottom: 18),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/next.png",
                    ),
                    alignment: Alignment.topRight,
                    fit: BoxFit.contain,
                  ),
                  // color: Theme.of(context).primaryColor,
                  border: Border(
                      bottom:
                          BorderSide(color: Theme.of(context).primaryColor))),
            ),
          ),
        ],
      ),
    );
  }
}
