// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt_shadow/view/admin/costom_widgets/textfield.dart';
import 'package:flutter/material.dart';

class Add_Mehandhi extends StatefulWidget {
  const Add_Mehandhi({super.key});

  State<Add_Mehandhi> createState() => _Add_CatogaryState();
}

class _Add_CatogaryState extends State<Add_Mehandhi> {
  TextEditingController Mehandhicontroller = TextEditingController();
  TextEditingController MehandhiPricecontroller = TextEditingController();
  TextEditingController MehandhiLocationcontroller = TextEditingController();

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
              MyTextfield(hintText: 'Name', controller: Mehandhicontroller),
              MyTextfield(
                  hintText: 'Location', controller: MehandhiLocationcontroller),
              MyTextfield(
                  hintText: 'Mehandhi/Person ₹',
                  controller: MehandhiPricecontroller),
            ElevatedButton(
                  onPressed: () async {
                      var teamData = {
                      "Name": Mehandhicontroller.text,
                      "Location": MehandhiLocationcontroller.text,
                      "Mehandhi_price": MehandhiPricecontroller.text,
                      
                    };
                    var db_ref = await FirebaseFirestore.instance
                        .collection("Mehandhi")
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
