// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt_shadow/view/admin/costom_widgets/textfield.dart';
import 'package:flutter/material.dart';


class Add_Makeup extends StatefulWidget {
  const Add_Makeup({super.key});

  State<Add_Makeup> createState() => _Add_CatogaryState();
}

class _Add_CatogaryState extends State<Add_Makeup> {

      TextEditingController Makeupcontroller = TextEditingController();
     TextEditingController MakeupLocationcontroller = TextEditingController();
      TextEditingController MakeupPricecontroller = TextEditingController();


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
               MyTextfield(hintText: 'Name', controller: Makeupcontroller),
              MyTextfield(hintText: 'Location', controller: MakeupLocationcontroller),
              MyTextfield(hintText: 'MakeUp/Person ₹', controller: MakeupPricecontroller),
              
            ElevatedButton(
                  onPressed: () async {
                    var teamData = {
                      "Name": Makeupcontroller.text,
                      "Location": MakeupLocationcontroller.text,
                      "MakeUp": MakeupPricecontroller.text,
                      
                    };
                    var db_ref = await FirebaseFirestore.instance
                        .collection("MakeUp")
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

