import 'package:evnt_shadow/utils/theme/custom/floating_action_theme.dart';
import 'package:flutter/material.dart';

class MyTheme{

  static  ThemeData myThemedark =  ThemeData(
            scaffoldBackgroundColor: Colors.black,
            floatingActionButtonTheme:FloatingActionTheme.myflotThemedark
          );

  static  ThemeData myThemelight =  ThemeData(
            scaffoldBackgroundColor: Colors.white,
            floatingActionButtonTheme:FloatingActionTheme.myflotThemelight
          );
}