
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({
    super.key,
  });

  
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("About",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 3,
          ),
          Text("Been on WedMeGood since 14 Years",
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(
            height: 15,
          ),
          Row(
            children: const [
              Expanded(
                child: SizedBox(
                    height: 100,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(
                        "The Wedding Decor Company Shadow Wedding Planners is based in Tirur and offers services Throught india. The have 17 years of wedding decoration experience and have demonsterated their unique plan.They also offer an indoor banquate function and an an outdoor banquate events.Furthere more,they have been doinng this work since 1996 and heance have a lot of experients. ",
                        style: TextStyle(
                          height: 2,
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
