import 'package:evnt_shadow/view/user/widgets/view_all.dart';
import 'package:flutter/material.dart';

class Our_vedios extends StatelessWidget {
  const Our_vedios({
    super.key,
  });

  
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Our Vedios & Stories",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  color: Colors.black,
                ),
                Container(
                  height: 70,
                  width: 70,
                  color: Colors.black,
                ),
                Container(
                  height: 70,
                  width: 70,
                  color: Colors.black,
                ),
                Container(
                  height: 70,
                  width: 70,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          View_all()
        ],
      ),
    );
  }
}
