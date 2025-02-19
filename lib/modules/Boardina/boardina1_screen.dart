import 'package:agre_lens_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:agre_lens_app/modules/Boardina/Boardina2_screen.dart';
import 'package:flutter/material.dart';
import 'Boardina2_screen.dart';

class Boardina1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/Boardina1_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Boardina2Screen()));
              },
              child: Text(
                'Skip',
                style: GoogleFonts.reemKufi(
                fontSize: 18, color: Colors.black),
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
                  "Plant life matters too.",
                  style: GoogleFonts.reemKufi(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.blackColor,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Take a snap of a plant you want to discover and understand.",
                  style: GoogleFonts.reemKufi(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.blackColor
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 40,
            top: 430,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 160,
                  height: 172,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1.5),
                    borderRadius: BorderRadius.all(Radius.elliptical(80, 86)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.elliptical(80, 86)),
                    child: Image.asset(
                      'assets/images/Magnified view.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Positioned(
                  child: Container(
                    width: 24,
                    height: 25,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 0.8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/Magnified view.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              left: 38,
              top: 430,
              child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
              'Magnified view',
              style: GoogleFonts.reemKufi(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Boardina2Screen()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: ColorManager.greenColor,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text(
                "Next",
                style: GoogleFonts.reemKufi(
                    fontSize: 18, color: ColorManager.blackColor
                ),
              ),
            ),
          ),
          Positioned(
            right: 20,
            left: 20,
            bottom: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 46,
                  height: 8.63,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      colors: [ColorManager.greenColor, Color(0xFF0AE0A0)],
                    ),
                  ),
                ),
                SizedBox(width: 30),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 30),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
