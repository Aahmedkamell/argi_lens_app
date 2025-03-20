import 'package:agre_lens_app/models/settings/settings_card.dart';
import 'package:agre_lens_app/models/settings/settings_item.dart';
import 'package:agre_lens_app/modules/profile/profile_screen.dart';
import 'package:agre_lens_app/modules/settings/notifications_screen.dart';
import 'package:agre_lens_app/modules/settings/privacy_policy_screen.dart';
import 'package:agre_lens_app/modules/settings/termes_of_use_screen.dart';
import 'package:agre_lens_app/modules/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final List<SettingsItem> settingsItems = [
    SettingsItem(title: 'Profile', screen: ProfileScreen()),
     SettingsItem(title: 'Notifications', screen: NotificationsScreen()),
    SettingsItem(title: 'Privacy Policy', screen: PrivacyPolicyScreen()),
     SettingsItem(title: 'Terms of Use', screen: TermsOfUseScreen()),
  ];

  final List<SettingsItem> otherItems =  [ // موقتا غلشان الرن
    SettingsItem(title: 'App Info', screen: ProfileScreen()),
    SettingsItem(title: 'Rate Our App', screen: ProfileScreen()),
    SettingsItem(title: 'Help Center', screen: ProfileScreen()),
    SettingsItem(title: 'Contact Us', screen: ProfileScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Settings',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        leading: const BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SettingsCard(items: settingsItems),
                    const SizedBox(height: 30),
                    SettingsCard(items: otherItems),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Log Out',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
