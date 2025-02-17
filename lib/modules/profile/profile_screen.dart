import 'package:agre_lens_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: Icon(
            Icons.arrow_back,
            size: 32,
            color: Color(0xFF484C52),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(
            color: ColorManager.blackColor,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 26),
            child: IconButton(
                onPressed: (){},
                icon: SvgPicture.asset(
                  'assets/icons/switch profile.svg',
                  width: 28,
                  height: 22.6,
                ),
            ),
          )
        ],
      ),
    );
  }
}
