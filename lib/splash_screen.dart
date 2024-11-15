import 'package:flutter/material.dart';
import 'dashboard.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "UTS Pemob",
              style: TextStyle(fontFamily: 'Poppins', fontSize: 24, fontWeight: FontWeight.bold),
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/img.png'),
            ),
            Text("152022087", style: TextStyle(fontFamily: 'Poppins', fontSize: 18)),
            Text("Abhyasa Gunawan Yusuf", style: TextStyle(fontFamily: 'Poppins', fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
