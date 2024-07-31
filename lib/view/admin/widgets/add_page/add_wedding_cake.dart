// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt_shadow/view/admin/costom_widgets/textfield.dart';
import 'package:flutter/material.dart';


class Add_Cake extends StatefulWidget {
  const Add_Cake({super.key});

  
  State<Add_Cake> createState() => _Add_CatogaryState();
}

class _Add_CatogaryState extends State<Add_Cake> {

      TextEditingController Cakecontroller = TextEditingController();
            TextEditingController CakeLocationcontroller = TextEditingController();
      TextEditingController CakePricecontroller = TextEditingController();


  
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
               MyTextfield(hintText: 'Cake Name', controller: Cakecontroller),
              MyTextfield(hintText: 'Location', controller: CakeLocationcontroller),
              MyTextfield(hintText: 'Price/Cake ₹', controller: CakePricecontroller),
              
          ElevatedButton(
                  onPressed: () async {
                    var teamData = {
                      "Cake_Name": Cakecontroller.text,
                      "Location": CakeLocationcontroller.text,
                      "Price": CakePricecontroller.text,
                      
                    };
                    var db_ref = await FirebaseFirestore.instance
                        .collection("Cake")
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

