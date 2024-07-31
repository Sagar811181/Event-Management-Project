// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt_shadow/view/admin/costom_widgets/textfield.dart';
import 'package:flutter/material.dart';

class Add_Venue extends StatefulWidget {
  const Add_Venue({super.key});

  State<Add_Venue> createState() => _Add_CatogaryState();
}

class _Add_CatogaryState extends State<Add_Venue> {
  TextEditingController Venuecontroller = TextEditingController();
  TextEditingController VenueLocationcontroller = TextEditingController();
  TextEditingController VenueIndoorcontroller = TextEditingController();
  TextEditingController VenueOutdoorcontroller = TextEditingController();

  TextEditingController VenueBanquetcontroller = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              MyTextfield(hintText: 'Venue Name', controller: Venuecontroller),
              MyTextfield(
                  hintText: 'Location', controller: VenueLocationcontroller),
              MyTextfield(
                  hintText: 'Indoor/Day ₹', controller: VenueIndoorcontroller),
              MyTextfield(
                  hintText: 'Out Door/Day ₹', controller: VenueOutdoorcontroller),
              MyTextfield(
                  hintText: 'Banquet Price/Day ₹',
                  controller: VenueBanquetcontroller),
          ElevatedButton(
                  onPressed: () async {
                    var teamData = {
                      "Venue_Name": Venuecontroller.text,
                      "Location": VenueLocationcontroller.text,
                      "Indoor_Price": VenueIndoorcontroller.text,
                      "Outdoor_Price": VenueOutdoorcontroller.text,
                      "Banquet_Price": VenueBanquetcontroller.text,
                    };
                    var db_ref = await FirebaseFirestore.instance
                        .collection("Venue")
                        .add(teamData);
                    if (!context.mounted) return;
                    Navigator.pop(context);
                  },
                  child: Text("Submit",),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
