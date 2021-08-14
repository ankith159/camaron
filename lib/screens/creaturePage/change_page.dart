import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePage extends StatefulWidget {
  const ChangePage({Key? key}) : super(key: key);

  @override
  _ChangePageState createState() => _ChangePageState();
}

class _ChangePageState extends State<ChangePage> {
  String type = 'Type';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio(value: 'Fishes', groupValue: type, onChanged: (value) {}),
              Container(
                margin: EdgeInsets.only(left: 50),
                child: Column(
                  children: [
                    Radio(
                        value: 'Fishes',
                        groupValue: type,
                        onChanged: (value) {}),
                    Radio(
                        value: 'Fishes',
                        groupValue: type,
                        onChanged: (value) {}),
                    Radio(
                        value: 'Fishes',
                        groupValue: type,
                        onChanged: (value) {}),
                    Radio(
                        value: 'Fishes',
                        groupValue: type,
                        onChanged: (value) {}),
                    Radio(
                        value: 'Fishes',
                        groupValue: type,
                        onChanged: (value) {}),
                  ],
                ),
              )
            ],
          ),
          Radio(value: 'Oyesters', groupValue: type, onChanged: (value) {}),
          Radio(value: 'Calms', groupValue: type, onChanged: (value) {}),
          Radio(value: 'Prawns', groupValue: type, onChanged: (value) {}),
        ],
      ),
    );
  }
}
