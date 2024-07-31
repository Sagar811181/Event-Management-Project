import 'package:flutter/material.dart';

class View_all extends StatelessWidget {
  const View_all({
    super.key,
  });

  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
      onTap: () {},
      child: Container(
        child: Center(
            child: Text(
          "View all",
          style: TextStyle(
              color: Colors.green, fontSize: 15, fontWeight: FontWeight.w300),
        )),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(border: Border.all(color: Colors.green)),
      ),
    ));
  }
}
