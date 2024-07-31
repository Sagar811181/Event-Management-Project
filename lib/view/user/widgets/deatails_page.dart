import 'package:evnt_shadow/view/user/widgets/avenue_details.dart';
import 'package:evnt_shadow/view/user/widgets/desplayd_image.dart';
import 'package:flutter/material.dart';

class Details_page extends StatelessWidget {
  const Details_page({super.key});

  
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            desplayd_image(),
            avenue_details(),

          ],
        ),
      ),
    );
  }
}
