import 'package:flutter/material.dart';

class StatusBarWidgets extends StatelessWidget {
  const StatusBarWidgets({
    super.key,
  });

  
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          //venus
          Column(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 36, 212, 42).withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 10,
                      offset: Offset(0,
                          3), // Changes the vertical position of the shadow
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/veneu/venues (2).jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => JoinUs()
                    //       //input the page
                    //    
                    //   ),
                    // );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Wedding",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w100),
              ),
              Text(
                "Venues",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w100),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
