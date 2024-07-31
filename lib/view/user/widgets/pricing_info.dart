import 'package:flutter/material.dart';

class Pricing_info extends StatelessWidget {
  const Pricing_info({
    super.key,
  });

  
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Pricing Info",
                style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold)),
                SizedBox(height: 12,),
                Row(
                  children: [
                    Text("Indoor Budget",
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
                    Spacer(),
                    Text("₹ 20000 - 25000",
                    style: TextStyle(color: Colors.black, fontSize: 12)),
      
                  ],
                ),
                  SizedBox(height: 12,),
                Row(
                  children: [
                    Text("Outdoor Budget",
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
                    Spacer(),
                    Text("₹ 40000 - 40000",
                    style: TextStyle(color: Colors.black, fontSize: 12)),
      
                  ],
                ),
                  SizedBox(height: 12,),
                Row(
                  children: [
                    Text("Banquet Decor Price",
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
                    Spacer(),
                    Text("₹ 20000",
                    style: TextStyle(color: Colors.black, fontSize: 12)),
      
                  ],
                ),
          ],
        ),
      );
  }
}
