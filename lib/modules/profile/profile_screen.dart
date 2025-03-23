import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state){},
      builder: (context, state){
        var cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Transform.scale(
                  scale: 0.8,
                  child: SvgPicture.asset(
                    'assets/icons/ep_back.svg',
                    width: 32,
                    height: 32,
                  ),
                ),
              ),
            ),
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
                child: InkWell(
                  onTap: (){},
                  child: SvgPicture.asset(
                    'assets/icons/switch profile.svg',
                    width: 24,
                    height: 24,

                    color: Color(0xFF475569)
                  ),
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
                    profileFormField(
                        label: 'User Name',  controller: cubit.userNameController),
                    const SizedBox(height: 16),
                    profileFormField(label: 'Farm Name',  controller: cubit.farmNameController),
                    const SizedBox(height: 16),
                    profileFormField(
                        label: 'Email',  controller: cubit.emailController),
                    const SizedBox(height: 16),
                    profileFormField(
                        controller: cubit.passwordController,
                        label: 'Password',
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
      },
    );
  }
}


