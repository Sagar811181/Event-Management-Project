import 'package:evnt_shadow/provider/authentication/authentication.dart';
import 'package:evnt_shadow/provider/authentication/google_authentication.dart';
import 'package:evnt_shadow/provider/google_authentication.dart';
import 'package:evnt_shadow/provider/registercoltroller.dart';
import 'package:evnt_shadow/provider/signupcontroller.dart';
import 'package:evnt_shadow/provider/user/home/home_provider.dart';
import 'package:evnt_shadow/start/join.dart';
import 'package:evnt_shadow/utils/theme/my_theme.dart';
import 'package:evnt_shadow/view/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Registercontroller(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpController(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => PickedImage(),
        // ),
        ChangeNotifierProvider(
          create: (context) => AuthServies(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthServies2(),
        ),
        
        
        ChangeNotifierProvider(
          create: (context) => MyAuthentication(),
        ),
        
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
       
        // ChangeNotifierProvider(
        //   create: (context) => Mannage_CatogaryProvider(),
        // ),
      ],
      child: MaterialApp(
          darkTheme: MyTheme.myThemedark,
          theme: MyTheme.myThemelight,
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          home: JoinUs()),
    );
  }
}
