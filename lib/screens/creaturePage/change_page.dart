import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChangePage extends StatefulWidget {
  final String id;
  ChangePage(this.id);

  @override
  _ChangePageState createState() => _ChangePageState();
}

class _ChangePageState extends State<ChangePage> {
  String type = 'Type';
  String fishes = 'subtype';
  String oyesters = 'subtype';
  String clams = 'subtype';
  String prawns = 'subtype';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.all(0),
          child: Text(
            "Creatures",
            style: GoogleFonts.roboto(
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
            textScaleFactor: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Radio(
                        value: 'Fishes',
                        groupValue: type,
                        onChanged: (value) {
                          setState(() {
                            type = 'Fishes';
                          });
                        }),
                    Text('Fishes')
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 50),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Radio(
                              value: 'Catla',
                              groupValue: fishes,
                              onChanged: (value) {
                                setState(() {
                                  fishes = value!.toString();
                                });
                              }),
                          Text('Catla')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 'Rohu',
                              groupValue: fishes,
                              onChanged: (value) {
                                setState(() {
                                  fishes = value!.toString();
                                });
                              }),
                          Text('Rohu')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 'Mrigal',
                              groupValue: fishes,
                              onChanged: (value) {
                                setState(() {
                                  fishes = value!.toString();
                                });
                              }),
                          Text('Mrigal')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 'Silver Carp',
                              groupValue: fishes,
                              onChanged: (value) {
                                setState(() {
                                  fishes = value!.toString();
                                });
                              }),
                          Text('Silver Carp')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 'Grass Carp',
                              groupValue: fishes,
                              onChanged: (value) {
                                setState(() {
                                  fishes = value!.toString();
                                });
                              }),
                          Text('Grass Carp')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 'Common Carp',
                              groupValue: fishes,
                              onChanged: (value) {
                                setState(() {
                                  fishes = value!.toString();
                                });
                              }),
                          Text('Common Carp')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 'Stripped Catfish',
                              groupValue: fishes,
                              onChanged: (value) {
                                setState(() {
                                  fishes = value!.toString();
                                });
                              }),
                          Text('Stripped Catfish')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 'Magur',
                              groupValue: fishes,
                              onChanged: (value) {
                                setState(() {
                                  fishes = value!.toString();
                                });
                              }),
                          Text('Magur')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 'Butter Catfish',
                              groupValue: fishes,
                              onChanged: (value) {
                                setState(() {
                                  fishes = value!.toString();
                                });
                              }),
                          Text('Butter Catfish')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 'Climbing Perch',
                              groupValue: fishes,
                              onChanged: (value) {
                                setState(() {
                                  fishes = value!.toString();
                                });
                              }),
                          Text('Climbing Perch')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 'Stripped Snakehead',
                              groupValue: fishes,
                              onChanged: (value) {
                                setState(() {
                                  fishes = value!.toString();
                                });
                              }),
                          Text('Stripped Snakehead')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 'Bullseye Snakehead',
                              groupValue: fishes,
                              onChanged: (value) {
                                setState(() {
                                  fishes = value!.toString();
                                });
                              }),
                          Text('Bullseye Snakehead')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 'Spotted Snakehead',
                              groupValue: fishes,
                              onChanged: (value) {
                                setState(() {
                                  fishes = value!.toString();
                                });
                              }),
                          Text('Spotted Snakehead')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 'Mussels',
                              groupValue: fishes,
                              onChanged: (value) {
                                setState(() {
                                  fishes = value!.toString();
                                });
                              }),
                          Text('Mussels')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 'Trout',
                              groupValue: fishes,
                              onChanged: (value) {
                                setState(() {
                                  fishes = value!.toString();
                                });
                              }),
                          Text('Trout')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 'Sea Bream',
                              groupValue: fishes,
                              onChanged: (value) {
                                setState(() {
                                  fishes = value!.toString();
                                });
                              }),
                          Text('Sea Bream')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 'Seabass',
                              groupValue: fishes,
                              onChanged: (value) {
                                setState(() {
                                  fishes = value!.toString();
                                });
                              }),
                          Text('Seabass')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 'Salmon',
                              groupValue: fishes,
                              onChanged: (value) {
                                setState(() {
                                  fishes = value!.toString();
                                });
                              }),
                          Text('Salmon')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 'Strugeon',
                              groupValue: fishes,
                              onChanged: (value) {
                                setState(() {
                                  fishes = value!.toString();
                                });
                              }),
                          Text('Strugeon')
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                Radio(
                    value: 'Oyesters',
                    groupValue: type,
                    onChanged: (value) {
                      setState(() {
                        type = 'Oyesters';
                      });
                    }),
                Text('Oyesters')
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 50),
              child: Column(
                children: [
                  Row(
                    children: [
                      Radio(
                          value: 'European Oyester',
                          groupValue: oyesters,
                          onChanged: (value) {
                            setState(() {
                              oyesters = value!.toString();
                            });
                          }),
                      Text('European Oyester')
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 'Pacific Oyester',
                          groupValue: oyesters,
                          onChanged: (value) {
                            setState(() {
                              oyesters = value!.toString();
                            });
                          }),
                      Text('Pacific Oyester')
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Radio(
                    value: 'Clams',
                    groupValue: type,
                    onChanged: (value) {
                      setState(() {
                        type = 'Clams';
                      });
                    }),
                Text('Clams')
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 50),
              child: Column(
                children: [
                  Row(
                    children: [
                      Radio(
                          value: 'Japanese Carpet Shell',
                          groupValue: clams,
                          onChanged: (value) {
                            setState(() {
                              clams = value!.toString();
                            });
                          }),
                      Text('Japanese Carpet Shell')
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 'Grooved Carpet Shell',
                          groupValue: clams,
                          onChanged: (value) {
                            setState(() {
                              clams = value!.toString();
                            });
                          }),
                      Text('Grooved Carpet Shell')
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Radio(
                    value: 'Prawns',
                    groupValue: type,
                    onChanged: (value) {
                      setState(() {
                        type = 'Prawns';
                      });
                    }),
                Text('Prawns')
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 50),
              child: Column(
                children: [
                  Row(
                    children: [
                      Radio(
                          value: 'Gaint Freshwater Prawn',
                          groupValue: prawns,
                          onChanged: (value) {
                            setState(() {
                              prawns = value!.toString();
                            });
                          }),
                      Text('Gaint Freshwater Prawn')
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 'Riverine Prawn',
                          groupValue: prawns,
                          onChanged: (value) {
                            setState(() {
                              prawns = value!.toString();
                            });
                          }),
                      Text('Riverine Prawn')
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 'Gaint Tiger Prawn',
                          groupValue: prawns,
                          onChanged: (value) {
                            setState(() {
                              prawns = value!.toString();
                            });
                          }),
                      Text('Gaint Tiger Prawn')
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 'Whiteleg Prawn',
                          groupValue: prawns,
                          onChanged: (value) {
                            setState(() {
                              prawns = value!.toString();
                            });
                          }),
                      Text('Whiteleg Prawn')
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 75,
            ),
            Center(
                child: ElevatedButton(
                    onPressed: () async {
                      var data = type == 'Fishes'
                          ? fishes
                          : type == 'Prawns'
                              ? prawns
                              : type == 'Clams'
                                  ? clams
                                  : oyesters;
                      await FirebaseFirestore.instance
                          .collection('devices')
                          .doc(widget.id)
                          .update({'creature': data});
                      Navigator.pop(context);
                    },
                    child: Text('Select'))),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
