// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt_shadow/view/admin/costom_widgets/textfield.dart';
import 'package:flutter/material.dart';

class Add_Card extends StatefulWidget {
  const Add_Card({super.key});

  
  State<Add_Card> createState() => _Add_CatogaryState();
}

class _Add_CatogaryState extends State<Add_Card> {

      TextEditingController Cardcontroller = TextEditingController();
            TextEditingController CardModelcontroller = TextEditingController();

      TextEditingController CardPricecontroller = TextEditingController();


  
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
               MyTextfield(hintText: 'Card Name', controller: Cardcontroller),
              
              MyTextfield(hintText: 'Price/Card ₹', controller: CardPricecontroller),
              
            ElevatedButton(
                  onPressed: () async {
                    var teamData = {
                      "Card_Name": Cardcontroller.text,
                    
                      "Price_Card": CardPricecontroller.text,
                     
                    };
                    var db_ref = await FirebaseFirestore.instance
                        .collection("Card")
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

