import 'package:agre_lens_app/modules/Boardina/boardina1_screen.dart';
import 'package:flutter/material.dart';
//import '../auth/login_screen.dart';

class Boardina3Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/boardina3_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    //navigate to login **
                    MaterialPageRoute(builder: (context) => Boardina1Screen()));
              },
              child: Text(
                'Skip',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Know the season your plants love.",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Set up reminders and keep your plant healthy and strong!",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 150,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
// المفروض هنا يروح على login يس دي مؤقتا يعني
                  MaterialPageRoute(builder: (context) => Boardina1Screen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text(
                "Get Started",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
