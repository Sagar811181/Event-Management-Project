import 'package:evnt_shadow/view/admin/widgets/list_page/h0sting_boys_List.dart';
import 'package:flutter/material.dart';

class Manage_Hosting_Boys extends StatelessWidget {
  const Manage_Hosting_Boys({
    super.key,
  });

  
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Hosting_Boys_list()));
      },
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
                  "Mannage",
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
                Text(
                  "Hosting Boys",
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ],
            ),
          )),
    );
  }
}
