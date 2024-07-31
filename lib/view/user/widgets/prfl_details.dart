import 'package:evnt_shadow/view/admin/costom_widgets/textfield.dart';
import 'package:flutter/material.dart';

class Prf_Details extends StatelessWidget {
  const Prf_Details({super.key});

  Widget build(BuildContext context) {
    TextEditingController userNamecontroller = TextEditingController();
    TextEditingController Emailcontroller = TextEditingController();
    TextEditingController countrynamecontroller = TextEditingController();
    TextEditingController Addresscontroller = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              MyTextfield(hintText: "Username", controller: userNamecontroller),
              SizedBox(height: 12,),
              MyTextfield(hintText: "Email", controller: Emailcontroller),
              SizedBox(height: 12,),
              MyTextfield(hintText: "Addres", controller: Addresscontroller),
              SizedBox(height: 12,),
              MyTextfield(hintText: "Country", controller: countrynamecontroller),
          
              SizedBox(height: 250,),
              SizedBox(height: 50,width: 150,
                child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                            onPressed: () {},
                            child: Text(
                "Submit",
                style: TextStyle(color: Colors.white),
                            ),
                          ),
              ),
              SizedBox(height: 50,)
                
                
            ],
          )
        ),
      ),
    );
  }
}
