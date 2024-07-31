import 'package:evnt_shadow/view/user/widgets/bottom/favorate.dart';
import 'package:evnt_shadow/view/user/widgets/bottom/home.dart';
import 'package:evnt_shadow/view/user/widgets/bottom/profile.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier{

 int myCurrentIndex = 1;
  List pages = [
    Favorate_page(),
    Homepage(),
    Profilepage(),
  ];

  changeIndex(index){
    myCurrentIndex = index;
    notifyListeners();
  }
}