import 'package:flutter/material.dart';

class desplayd_image extends StatelessWidget {
  const desplayd_image({
    super.key,
  });

  
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 370,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/veneu/venues (6).jpeg',
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
        Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.arrow_back),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

