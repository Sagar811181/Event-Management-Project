// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt_shadow/view/admin/costom_widgets/textfield.dart';
import 'package:flutter/material.dart';


class Add_Hosting_Girl extends StatefulWidget {
  const Add_Hosting_Girl({super.key});

  State<Add_Hosting_Girl> createState() => _Add_CatogaryState();
}

class _Add_CatogaryState extends State<Add_Hosting_Girl> {

      TextEditingController HostingGirlscontroller = TextEditingController();
            TextEditingController HostingGirlWagescontroller = TextEditingController();
                        TextEditingController HGirlBanquetWagescontroller = TextEditingController();



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
              MyTextfield(hintText: 'Group Name', controller: HostingGirlscontroller),
              MyTextfield(hintText: 'Wage/Day ₹', controller: HostingGirlWagescontroller),
             MyTextfield(hintText: 'Banquet Wage/Day ₹', controller: HGirlBanquetWagescontroller),

              
            ElevatedButton(
                  onPressed: () async {
                     var teamData = {
                      "Group_Name": HostingGirlscontroller.text,
                      "Wage/": HostingGirlWagescontroller.text,
                      "Banquet_price": HGirlBanquetWagescontroller.text,
                    
                    };
                    var db_ref = await FirebaseFirestore.instance
                        .collection("HostingGirls")
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

