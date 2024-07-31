import 'package:flutter/material.dart';

class Favorate_page extends StatelessWidget {
  const Favorate_page({super.key});

  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      appBar: AppBar(
          title: Text(
            "Favorate",
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 22,
              color: Colors.white,
              fontFamily: "ArchitectsDaughter",
            ),
          ),
          backgroundColor: Color.fromARGB(255, 15, 15, 15),),
      body: Column(
        children: [
       
        ],
      ),
    );
  }
}
