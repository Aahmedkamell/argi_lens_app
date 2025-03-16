import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: const BackButton(color: Colors.black),
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset(
              'assets/icons/switch profile.svg',
              width: 32,
              height: 32,
            
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              children: [
                const SizedBox(height: 40),
                SizedBox(
                  width: 144,
                  height: 144,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 72,
                        backgroundColor: Colors.grey.shade300,
                        backgroundImage: AssetImage(
                          'assets/images/profile_pic.png',
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(9),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/camera_icon.png',
                            width: 26.666667938232422,
                            height: 24,
                            color: const Color(0xCF242760),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                ProfileField(
                    label: 'User Name', initialValue: 'Mohamed Tharwat'),
                const SizedBox(height: 16),
                ProfileField(label: 'Farm Name', initialValue: 'My Farm'),
                const SizedBox(height: 16),
                ProfileField(
                    label: 'Email', initialValue: 'acc.motharwat@gmail.com'),
                const SizedBox(height: 16),
                ProfileField(
                    label: 'Password',
                    initialValue: '************',
                    obscureText: true),
                const SizedBox(height: 40),
                SizedBox(
                  width: 180,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff4CAF50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Save Changes',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileField extends StatelessWidget {
  final String label;
  final String initialValue;
  final bool obscureText;

  const ProfileField({
    super.key,
    required this.label,
    required this.initialValue,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            height: 0.88,
            letterSpacing: 0,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 342,
          height: 69,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: const Color(0x24544C4C)),
          ),
          child: TextFormField(
            initialValue: initialValue,
            obscureText: obscureText,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              border: InputBorder.none,
            ),
            style: GoogleFonts.openSans(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
