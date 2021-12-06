import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FishFeedCal extends StatefulWidget {
  const FishFeedCal({Key? key}) : super(key: key);

  @override
  _FishFeedCalState createState() => _FishFeedCalState();
}

class _FishFeedCalState extends State<FishFeedCal> {
  TextEditingController crudeProtein = TextEditingController();
  TextEditingController feedQuantity = TextEditingController();
  TextEditingController ingredient1 = TextEditingController();
  TextEditingController ingredient2 = TextEditingController();
  TextEditingController ingredient3 = TextEditingController();
  TextEditingController ingredient4 = TextEditingController();
  var user = FirebaseAuth.instance.currentUser;
  var valueChoose;
  List listItem = ['Cotton Seed Meal - 44.30CP', 'Fish Meal- 55.00CP', 'Groundnut Cake - 34.50CP', 'Ipil-Ipil Seed - 35.80CP', 'Rape Seed -  37.40CP', 'Soyabean Meal - 46.80CP', 'Sunflower Seed - 34.10CP'];
  var valueSelect;
  List listItems = ['Maize Meal - 9.80CP', 'Rice Bran - 13.30CP', 'Sorghum Bran - 8.90CP', 'Wheat Bran - 18.80CP'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
      appBar: AppBar(
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.all(0),
          child: Text(
            "Fish Feed Calculator",
            style: GoogleFonts.roboto(
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
            textScaleFactor: 1,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Container(
                child: Text('%CP'),
              ),
              title: TextField(
                controller: crudeProtein,
                decoration: InputDecoration(hintText: 'Crude Protein(10-44)'),
              ),
            ),
            ListTile(
              leading: Container(
                child: Text('KG'),
              ),
              title: TextField(
                controller: feedQuantity,
                decoration: InputDecoration(hintText: 'Feeds Quantity'),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Ingredient 1'),
                       Padding(
                         padding: const EdgeInsets.only(top: 7),
                         child: Container(
                           padding: const EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(6),
                      ),
                           child: DropdownButton(
                            hint:  Text(
                              'Ingredient 1',
                              style: TextStyle(
                                  color: Colors.grey[600],),
                            ),
                            dropdownColor: Colors.white,
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                            ),
                            iconSize: 26,
                            isExpanded: true,
                            underline: const SizedBox(
                              width: 0,
                            ),
                            value: valueChoose,
                            onChanged: (newValue) {
                              setState(
                                () {
                                  valueChoose = newValue;
                                },
                              );
                            },
                            items: listItem.map(
                              (valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem),
                                );
                              },
                            ).toList(),
                      ),
                         ),
                       ),
                    ],
                  ),
                ),
                SizedBox(width: 15,),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Ingredient 2'),
                       Padding(
                         padding: const EdgeInsets.only(top: 7),
                         child: Container(
                           padding: const EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(6),
                      ),
                           child: DropdownButton(
                            hint:  Text(
                              'Ingredient 2',
                              style: TextStyle(
                                  color: Colors.grey[600],),
                            ),
                            dropdownColor: Colors.white,
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                            ),
                            iconSize: 26,
                            isExpanded: true,
                            underline: const SizedBox(
                              width: 0,
                            ),
                            value: valueSelect,
                            onChanged: (newValue) {
                              setState(
                                () {
                                  valueSelect = newValue;
                                },
                              );
                            },
                            items: listItems.map(
                              (valueItems) {
                                return DropdownMenuItem(
                                  value: valueItems,
                                  child: Text(valueItems),
                                );
                              },
                            ).toList(),
                      ),
                         ),
                       ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Ingredient 3'),
                      ListTile(
                        title: TextField(
                          controller: ingredient3,
                          decoration: InputDecoration(hintText: 'Ingredient 3'),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Ingredient 4'),
                      ListTile(
                        title: TextField(
                          controller: ingredient4,
                          decoration: InputDecoration(hintText: 'Ingredient 4'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      print(user!.uid);
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(user!.uid)
                          .update({
                        'fishFeedCalculator': {
                          'cp': crudeProtein.text,
                          'feedQuantity': feedQuantity.text,
                          'ingredient1': ingredient1.text,
                          'ingredient2': ingredient2.text,
                          'ingredient3': ingredient3.text,
                          'ingredient4': ingredient4.text,
                        }
                      }).then((value) {
                        crudeProtein.clear();
                        feedQuantity.clear();
                        ingredient1.clear();
                        ingredient2.clear();
                        ingredient3.clear();
                        ingredient4.clear();
                      });
                    },
                    child: Text('Save')))
          ],
        ),
      ),
    );
  }
}