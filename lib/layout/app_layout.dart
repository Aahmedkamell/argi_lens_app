import 'package:agre_lens_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../modules/profile/profile_screen.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: (cubit.currentIndex == 0 || cubit.currentIndex == 1)
              ? AppBar(
                  title: Text(
                    'Hi, Mohamed',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(65, 64, 66, 1)),
                  ),
                  automaticallyImplyLeading: false,
                  actions: [
                      Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 23),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileScreen()),
                            );

                          },
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.transparent,
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/profile_pic.png',
                                fit: BoxFit.cover,
                                width: 45,
                                height: 44,
                              ),
                            ),
                          ),
                        ),
                      )
                    ])
              : null,
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: Stack(
            children: [
              Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 2,
                      spreadRadius: 0,
                      offset: Offset(0, -3),
                    )
                  ]
                ),
              ),
              BottomNavigationBar(
                items: cubit.bottomItems,
                currentIndex: cubit.currentIndex,
                elevation: 0,
                selectedItemColor: ColorManager.greenColor,
                unselectedItemColor: const Color(0xFF484C52), //
                selectedLabelStyle:
                    TextStyle(color: ColorManager.greenColor, fontSize: 12),
                unselectedLabelStyle:
                    TextStyle(color: Color(0xFF484C52), fontSize: 12),
                type: BottomNavigationBarType.fixed,
                onTap: (index) {
                  cubit.changeNavBarIndex(index);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
