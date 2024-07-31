import 'package:evnt_shadow/provider/user/home/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Bottom extends StatelessWidget {
  const Bottom({super.key});

  
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (BuildContext context, HomeProvider value, Widget? child) { 
        return Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: (Colors.black), blurRadius: 30, offset: Offset(0, 10))
          ]),
          child: BottomNavigationBar(
              currentIndex: value.myCurrentIndex,
              backgroundColor: Color.fromARGB(255, 15, 15, 15),
              selectedItemColor:  Colors.green,
              unselectedItemColor: Colors.white,
              selectedFontSize: 10,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              onTap: Provider.of<HomeProvider>(context,listen: false).changeIndex,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border), label: "Favorate"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline), label: "Profile"),
              ]),
        ),
        body: value.pages[value.myCurrentIndex],
      );
       },
        );
  }
}
