
import 'package:flutter/material.dart';

class Our_Wedding_cake extends StatelessWidget {
  const Our_Wedding_cake({
    super.key,
  });

  
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(children: [
     Container(
       height: 170,
       width: 130,
       decoration: BoxDecoration(
         image: DecorationImage(
           image: AssetImage(
             "assets/images/cake/cake (5).jpg",
           ),
           fit: BoxFit.cover,
         ),
         borderRadius: BorderRadius.circular(15),
       ),
       child: Container(
         decoration: BoxDecoration(
           gradient: LinearGradient(
             colors: [
               Colors.transparent,
               Colors.transparent,
               Colors.black,
             ],
             begin: Alignment.topCenter,
             end: Alignment.bottomCenter,
           ),
         ),
         child: GestureDetector(
           onTap: () {
             // Navigator.push(
             //   context,
             //   MaterialPageRoute(
             //       builder: (context) => JoinUs()
             //       //input the page
             //       ),
             // );
           },
         ),
       ),
     ),
     Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           SizedBox(
             height: 120,
           ),
           Text(
             "Fluffy",
             style: TextStyle(
               color: Colors.white,
               fontFamily: "ArchitectsDaughter",
               fontSize: 12,
             ),
           ),
           SizedBox(
             height: 3,
           ),
           Text(
             "₹ 2500/Cake",
             style: TextStyle(
                 color: Colors.green,
                 fontSize: 10,
                 fontWeight: FontWeight.bold),
           ),
         ],
       ),
     ),
                  ])),
            ],
          ),
        );
  }
}
