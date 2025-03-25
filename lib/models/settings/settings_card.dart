import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/settings/settings_item.dart';

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
                      builder: (context) => item.screen,
                    ),
                  );
                },
              ),
              if (item != items.last)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Divider(
                    thickness: 1,
                    height: 0,
                    color: Color(0xFFAAAAAA),
                  ),
                ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
