import 'package:agre_lens_app/models/settings/settings_item.dart';
import 'package:agre_lens_app/modules/profile/profile_screen.dart';
import 'package:agre_lens_app/modules/settings/app_info_screen.dart';
import 'package:agre_lens_app/modules/settings/contact_us_screen.dart';
import 'package:agre_lens_app/modules/settings/help_center_screen.dart';
import 'package:agre_lens_app/modules/settings/notifications_screen.dart';
import 'package:agre_lens_app/modules/settings/privacy_policy_screen.dart';
import 'package:agre_lens_app/modules/settings/rating_screen.dart';
import 'package:agre_lens_app/modules/settings/termes_of_use_screen.dart';
import 'package:flutter/material.dart';


final List<SettingsItem> settingsItems = [
  SettingsItem(title: 'Profile', screen: ProfileScreen()),
  SettingsItem(title: 'Notifications', screen: NotificationsScreen()),
  SettingsItem(title: 'Privacy Policy', screen: PrivacyPolicyScreen()),
  SettingsItem(title: 'Terms of Use', screen: TermsOfUseScreen()),
];

final List<SettingsItem> otherSettingsItems = [
  SettingsItem(title: 'App Info', screen: AppInfoScreen()),
  SettingsItem(
    title: 'Rate Our App',
    screen: RateAppScreen(),
  ),
  SettingsItem(title: 'Help Center', screen: HelpCenterScreen()),
  SettingsItem(title: 'Contact Us', screen: ContactUsScreen()),
];
