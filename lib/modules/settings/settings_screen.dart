import 'package:agre_lens_app/models/settings/settings_card.dart';
import 'package:agre_lens_app/models/settings/settings_item.dart';
import 'package:agre_lens_app/modules/profile/profile_screen.dart';
import 'package:agre_lens_app/modules/settings/notifications_screen.dart';
import 'package:agre_lens_app/modules/settings/privacy_policy_screen.dart';
import 'package:agre_lens_app/modules/settings/termes_of_use_screen.dart';
import 'package:agre_lens_app/modules/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

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
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.grey.shade100,
          appBar: AppBar(
            backgroundColor: Colors.grey.shade100,
            elevation: 0,
            centerTitle: true,
              leading: IconButton(
                onPressed: (){
                  cubit.changeNavBarIndex(0);
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 32,
                  color: Color(0xFF484C52),
                ),
              ),
            title: Text(
              'Settings',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
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
                        builder: (context) => const LoginPage(), //login screen
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
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
      },
    );
  }
}


class SettingsCard extends StatelessWidget {
  final List<SettingsItem> items;
  const SettingsCard({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: items.map((item) {
          return Column(
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          item.title,
                          style: GoogleFonts.openSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfileScreen(),
                            ),
                          );
                        },
                      ),
                      if (item != items.last)
                        Padding(
                          padding: EdgeInsets.only(
                            left: 16,
                            right: constraints.maxWidth * 0.07,
                          ),
                          child: const Divider(
                            thickness: 1,
                            height: 0,
                            color: Color(0xFFAAAAAA),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

/*
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: Center(
        child: Text(
          'Profile Screen',
          style: GoogleFonts.openSans(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Login Screen',
          style: GoogleFonts.openSans(fontSize: 18),
        ),
      ),
    );
  }
}*/
