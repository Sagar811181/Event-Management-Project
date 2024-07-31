import 'package:evnt_shadow/view/admin/widgets/list_page/hosting_girls_list.dart';
import 'package:flutter/material.dart';

class Manage_Hosting_girls extends StatelessWidget {
  const Manage_Hosting_girls({
    super.key,
  });

  
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Hosting_Girls_list()));
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
                  "Hosting Girls",
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ],
            ),
          )),
    );
  }
}
