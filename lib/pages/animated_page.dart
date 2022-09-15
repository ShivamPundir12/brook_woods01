import 'dart:async';
import 'package:brook_woods01/pages/Navbar/nav_bar.dart';
import 'package:brook_woods01/services/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'login_page.dart';

String? finalEmail, finalName;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SecureStorage secureStorage = SecureStorage();
  @override
  void initState() {
    secureStorage.readSecureData('email').then((value) {
      finalEmail = value;
    });
    secureStorage.readSecureData('name').then((value) {
      finalName = value;
    });
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            PageTransition(
                child: finalEmail == null ? MyLogin() : NavPage(),
                type: PageTransitionType.rightToLeftWithFade)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo.shade700,
        body: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 80),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 110,
                        ),
                        child: SizedBox(
                          height: 130.0,
                          child: Image.asset(
                            'assets/furnitures.png',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: SizedBox(
                          height: 140,
                          width: 200,
                          child: LinearPercentIndicator(
                            barRadius: Radius.circular(20),
                            percent: 100 / 100,
                            animation: true,
                            animationDuration: 1450,
                            center: Text(
                              'Loading...',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Lobster',
                                  color: Colors.white60),
                            ),
                            lineHeight: 20,
                            width: 200.0,
                            progressColor: Colors.blueAccent.shade200,
                          ),
                        ),
                      )
                    ]),
              ),
            ),
          ),
        ));
  }
}
