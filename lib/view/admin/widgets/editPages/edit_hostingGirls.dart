// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt_shadow/view/admin/costom_widgets/textfield.dart';
import 'package:flutter/material.dart';
class EditHostibgGirls extends StatelessWidget {
   EditHostibgGirls({super.key,required this.docId});
 final String docId;
  TextEditingController EditHostibgGirlsNamecontroller = TextEditingController();
    TextEditingController EditHostibgGirlsWagecontroller = TextEditingController();
    
  
  Widget build(BuildContext context) {
    return Scaffold(body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("HostingGirls")
            .doc(docId)
            .get(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (snapshot.hasData) {
            EditHostibgGirlsNamecontroller.text = snapshot.data!["Group_Name"];
            EditHostibgGirlsWagecontroller.text = snapshot.data!["Wages"];
            
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  MyTextfield(
                      hintText: 'Group Name',
                      controller: EditHostibgGirlsNamecontroller),
                  MyTextfield(
                      hintText: 'Wage/Day',
                      controller: EditHostibgGirlsWagecontroller),
                 
                  ElevatedButton(
                      onPressed: () async {
                        var teamData = {
                          "Group_Name": EditHostibgGirlsNamecontroller.text,
                          "Wages": EditHostibgGirlsWagecontroller.text,
                          
                        };
                        var db_ref = await FirebaseFirestore.instance
                            .collection("HostingGirls")
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