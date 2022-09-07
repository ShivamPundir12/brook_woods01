import 'package:brook_woods01/pages/Navbar/cart_page/cart_provider.dart';
import 'package:brook_woods01/pages/Navbar/nav_bar.dart';
import 'package:brook_woods01/pages/Navbar/profile_page.dart';
import 'package:brook_woods01/pages/animated_page.dart';
import 'package:brook_woods01/pages/home_page/data/home_data.dart';
import 'package:brook_woods01/pages/login_page.dart';
import 'package:brook_woods01/pages/pass_reset.dart';
import 'package:brook_woods01/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (BuildContext context) => Models()),
      ChangeNotifierProvider(create: (BuildContext context) => Cart()),
    ],
    child: MaterialApp(
        title: 'BrookWoods',
        debugShowCheckedModeBanner: false,
        routes: {
          '/reset': (context) => ForgotPassword(),
          '/Animated': (context) => SplashScreen(),
          '/Profile': (context) => Profile(),
          '/home': (context) => MyLogin(),
          '/register': (context) => MyRegister(),
          '/nav': (context) => NavPage(),
        },
        home: SplashScreen()),
  ));
}
