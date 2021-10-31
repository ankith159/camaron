import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedingCal extends StatefulWidget {
  const FeedingCal({Key? key}) : super(key: key);

  @override
  _FeedingCalState createState() => _FeedingCalState();
}

class _FeedingCalState extends State<FeedingCal> {
  TextEditingController stocking = TextEditingController();
  TextEditingController bodyWeightpcs = TextEditingController();
  TextEditingController bodyWeight = TextEditingController();
  TextEditingController daysOfCulture = TextEditingController();
  var user = FirebaseAuth.instance.currentUser;

  var species = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.all(0),
          child: Text(
            "Feeding Calculator",
            style: GoogleFonts.roboto(
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
            textScaleFactor: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
                value: species,
                onChanged: (val) {
                  setState(() {
                    species = val!;
                  });
                },
                items: [
                  DropdownMenuItem(child: Text('Catla'), value: 'Catla'),
                  DropdownMenuItem(child: Text('Rohu'), value: 'Rohu'),
                  DropdownMenuItem(child: Text('Mrigal'), value: 'Mrigal'),
                  DropdownMenuItem(
                      child: Text('Silver Carp'), value: 'Silver Carp'),
                  DropdownMenuItem(
                      child: Text('Grass Carp'), value: 'Grass Carp'),
                  DropdownMenuItem(
                      child: Text('Common Carp'), value: 'Common Carp'),
                  DropdownMenuItem(
                      child: Text('Stripped Catfish'),
                      value: 'Stripped Catfish'),
                  DropdownMenuItem(child: Text('Magur'), value: 'Magur'),
                  DropdownMenuItem(
                      child: Text('Butter Catfish'), value: 'Butter Catfish'),
                  DropdownMenuItem(
                      child: Text('Climbing Perch'), value: 'Climbing Perch'),
                  DropdownMenuItem(
                      child: Text('Stripped Snakehead'),
                      value: 'Stripped Snakehead'),
                  DropdownMenuItem(
                      child: Text('Bullseye Snakehead'),
                      value: 'Bullseye Snakehead'),
                  DropdownMenuItem(
                      child: Text('Spotted Snakehead'),
                      value: 'Spotted Snakehead'),
                  DropdownMenuItem(child: Text('Trout'), value: 'Trout'),
                  DropdownMenuItem(
                      child: Text('Sea Bream'), value: 'Sea Bream'),
                  DropdownMenuItem(child: Text('Salmon'), value: 'Salmon'),
                  DropdownMenuItem(child: Text('Strugeon'), value: 'Strugeon'),
                  DropdownMenuItem(
                      child: Text('European Oyester'),
                      value: 'European Oyester'),
                  DropdownMenuItem(
                      child: Text('Pacific Oyester'), value: 'Pacific Oyester'),
                  DropdownMenuItem(
                      child: Text('Japanese Carpet Shell'),
                      value: 'Japanese Carpet Shell'),
                  DropdownMenuItem(
                      child: Text('Grooved Carpet Shell'),
                      value: 'Grooved Carpet Shell'),
                  DropdownMenuItem(
                      child: Text('Gaint Freshwater Prawn'),
                      value: 'Gaint Freshwater Prawn'),
                  DropdownMenuItem(
                      child: Text('Gaint Tiger Prawn'),
                      value: 'Gaint Tiger Prawn'),
                  DropdownMenuItem(
                      child: Text('Riverine Prawn'), value: 'Riverine Prawn'),
                  DropdownMenuItem(
                      child: Text('Whiteleg Prawn'), value: 'Whiteleg Prawn'),
                ],
                hint: Text('Species')),
            SizedBox(
              height: 20,
            ),
            Text('Number of stocking(*)'),
            ListTile(
              title: TextField(
                controller: stocking,
              ),
              trailing: Text('pcs'),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Average body weight of shrimps(*)'),
            ListTile(
              title: TextField(
                controller: bodyWeightpcs,
              ),
              trailing: Text('pcs/KG'),
            ),
            ListTile(
              title: TextField(
                controller: bodyWeight,
              ),
              trailing: Text('g/pc'),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Days of culture'),
            ListTile(
              title: TextField(
                controller: daysOfCulture,
              ),
              trailing: Text('days'),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('users')
                      .doc(user!.uid)
                      .update({
                    'feedingCalculator': {
                      'species': species,
                      'stocking': stocking.text,
                      'bodyWeightPcs': bodyWeightpcs.text,
                      'bodyWeightGpc': bodyWeight.text,
                      'daysOfCulture': daysOfCulture.text,
                    }
                  }).then((value) {
                    species = null;
                    stocking.clear();
                    bodyWeightpcs.clear();
                    bodyWeight.clear();
                    daysOfCulture.clear();
                  });
                },
                child: Text('Save'),
              ),
            )
          ],
        ),
      )),
    );
  }
}
