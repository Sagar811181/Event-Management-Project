import 'package:evnt_shadow/view/user/widgets/Our_veneus.dart';
import 'package:evnt_shadow/view/user/widgets/about.dart';
import 'package:evnt_shadow/view/user/widgets/our_vedios&stories.dart';
import 'package:evnt_shadow/view/user/widgets/pricing_info.dart';
import 'package:flutter/material.dart';

class avenue_details extends StatelessWidget {
  const avenue_details({
    super.key,
  });

  
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Jalsa Avenue",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "ArchitectsDaughter",
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border_sharp),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Tirur,Malappuram,kerala",
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.grey,
                    size: 20,
                  ),
                  Text(
                    "Location",
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.green,
                    size: 25,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "4.9 Superb ",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  Text(
                    " (166 Reviws)",
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                  Spacer(),
                  Container(
                    height: 25,
                    width: 60,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.green)),
                    child: Center(
                      child: Text(
                        "Available",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              Pricing_info(),
              Divider(),
              Our_Wedding_Venues(),
              Our_vedios(),
              Divider(),
              
              About(),
              
              Container(
                  child: Center(
                      child: Text(
                    "Book Our Plan",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w300),
                  )),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.green)),
            ],
          ),
        ),
      ],
    );
  }
}
