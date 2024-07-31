import 'package:flutter/material.dart';

class Add_Story extends StatelessWidget {
  const Add_Story({
    super.key,
  });

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => const ()));
      },
      child: Center(
        child: Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 45, 44, 44),
                borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Add",
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  Text(
                    "Story",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
