import 'package:flutter/material.dart';

class Version extends StatelessWidget {
  const Version({super.key});

  
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
body: Padding(
  padding: const EdgeInsets.all(20),
  child: Column(
    children: [SizedBox(height: 40,),
      Text("Latest version : 2.H30.0",style: TextStyle(
        color: Colors.white,fontSize: 15
      ),)
    ],
  ),
),
    );
  }
}