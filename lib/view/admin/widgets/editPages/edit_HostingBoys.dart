// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt_shadow/view/admin/costom_widgets/textfield.dart';
import 'package:flutter/material.dart';

class EditHostingBoys extends StatelessWidget {
   EditHostingBoys({super.key,required this.docId});
 final String docId;
   TextEditingController EditHostingBoysNamecontroller = TextEditingController();
    TextEditingController EditHostingBoysWagecontroller = TextEditingController();
    

  
  Widget build(BuildContext context) {
    return Scaffold(body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("HostingBoys")
            .doc(docId)
            .get(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (snapshot.hasData) {
            EditHostingBoysNamecontroller.text = snapshot.data!["Set_Name"];
            EditHostingBoysWagecontroller.text = snapshot.data!["Wages"];
            
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  MyTextfield(
                      hintText: 'Group Name',
                      controller: EditHostingBoysNamecontroller),
                  MyTextfield(
                      hintText: 'Wage/Day',
                      controller: EditHostingBoysWagecontroller),
                 
                  ElevatedButton(
                      onPressed: () async {
                        var teamData = {
                          "Set_Name": EditHostingBoysNamecontroller.text,
                          "Wages": EditHostingBoysWagecontroller.text,
                         
                        };
                        var db_ref = await FirebaseFirestore.instance
                            .collection("HostingBoys")
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