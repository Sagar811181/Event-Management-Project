// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt_shadow/view/admin/costom_widgets/textfield.dart';
import 'package:flutter/material.dart';

class EditCar extends StatelessWidget {
   EditCar({super.key,required this.docId});
 final String docId;

    TextEditingController EditCarNamecontroller = TextEditingController();
        TextEditingController EditCarModelcontroller = TextEditingController();
    TextEditingController EditCarLocationcontroller = TextEditingController();
    TextEditingController EditCarPricecontroller = TextEditingController();
  
  

  Widget build(BuildContext context) {
    return Scaffold(body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("Car")
            .doc(docId)
            .get(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (snapshot.hasData) {
            EditCarNamecontroller.text = snapshot.data!["Car_Name"];
              EditCarModelcontroller.text = snapshot.data!["Model"];
            EditCarLocationcontroller.text = snapshot.data!["Location"];
            EditCarPricecontroller.text = snapshot.data!["Price"];
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  MyTextfield(
                      hintText: 'Car Name',
                      controller: EditCarNamecontroller),
                  MyTextfield(
                      hintText: 'Model',
                      controller: EditCarModelcontroller),
                      MyTextfield(
                      hintText: 'Location',
                      controller: EditCarLocationcontroller),
                  MyTextfield(
                      hintText: 'price',
                      controller: EditCarPricecontroller),
                  ElevatedButton(
                      onPressed: () async {
                        var teamData = {
                          "Car_Name": EditCarNamecontroller.text,
                          "Model": EditCarModelcontroller.text,
                          "location": EditCarLocationcontroller.text,
                          "Price": EditCarPricecontroller.text,
                        };
                        var db_ref = await FirebaseFirestore.instance
                            .collection("Car")
                            .doc(docId)
                            .update(teamData);
                        if (!context.mounted) return;
                        Navigator.pop(context);
                        
                      },
                      
                      child: Text("Update"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      )),
                ],
              ),
            );
          } else {
            return Text("no data to edit");
          }
        },
      ),
    );
  }
}