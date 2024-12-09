import 'package:flutter/material.dart';
import 'package:wisata_mobile_5/screens/landingpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    //Menunda sebanyak 3 detik

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LandingPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "images/kiosk.gif",
              height: 125.0,
              width: 125.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 300,
                ),
                Text(
                  'SINAR STREET',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1B1B1B)),
                ),
                Text(
                  'FOOD',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1B1B1B)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
