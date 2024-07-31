// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt_shadow/view/admin/costom_widgets/textfield.dart';
import 'package:flutter/material.dart';

class Add_Hosting_Boys extends StatefulWidget {
  const Add_Hosting_Boys({super.key});

  State<Add_Hosting_Boys> createState() => _Add_CatogaryState();
}

class _Add_CatogaryState extends State<Add_Hosting_Boys> {

      TextEditingController HostingBoyscontroller = TextEditingController();
      TextEditingController HBoysWagecontroller = TextEditingController();
      TextEditingController HBoysBanquetWagecontroller = TextEditingController();



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
              MyTextfield(hintText: 'Group Name', controller: HostingBoyscontroller),
              MyTextfield(hintText: 'Wage/Day ₹', controller: HBoysWagecontroller),
              MyTextfield(hintText: 'Banquet Wage/Day ₹', controller: HBoysBanquetWagecontroller),
              
           ElevatedButton(
                  onPressed: () async {
                    var teamData = {
                      "Group_Name": HostingBoyscontroller.text,
                      "Wage": HBoysWagecontroller.text,
                      "Banquet_price": HBoysBanquetWagecontroller.text,
                    
                    };
                    var db_ref = await FirebaseFirestore.instance
                        .collection("HostingBoys")
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

