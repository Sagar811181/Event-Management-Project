// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt_shadow/view/admin/costom_widgets/textfield.dart';
import 'package:flutter/material.dart';
class EditMehandi extends StatelessWidget {
   EditMehandi({super.key,required this.docId});
 final String docId;
  TextEditingController EditMehandiNamecontroller = TextEditingController();
    TextEditingController EditMehandiLocationcontroller = TextEditingController();
    TextEditingController EditMehandiPricecontroller = TextEditingController();
  
  Widget build(BuildContext context) {
    return Scaffold(body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("Mehandhi")
            .doc(docId)
            .get(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (snapshot.hasData) {
            EditMehandiNamecontroller.text = snapshot.data!["Name"];
            EditMehandiLocationcontroller.text = snapshot.data!["Location"];
            EditMehandiPricecontroller.text = snapshot.data!["Mehandhi_price"];
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  MyTextfield(
                      hintText: 'Group Name',
                      controller: EditMehandiNamecontroller),
                  MyTextfield(
                      hintText: 'Location',
                      controller: EditMehandiLocationcontroller),
                  MyTextfield(
                      hintText: 'Mehandhi price',
                      controller: EditMehandiPricecontroller),
                  ElevatedButton(
                      onPressed: () async {
                        var teamData = {
                          "Name": EditMehandiNamecontroller.text,
                          "Location": EditMehandiLocationcontroller.text,
                          "Mehandhi_price": EditMehandiPricecontroller.text,
                        };
                        var db_ref = await FirebaseFirestore.instance
                            .collection("Mehandhi")
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