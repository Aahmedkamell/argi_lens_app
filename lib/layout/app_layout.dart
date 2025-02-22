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
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
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
                                child: Image.network(
                                  'https://s3-alpha-sig.figma.com/img/3db6/28d8/114007a2224cdc91cff4b6f9f47f7187?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=FKaOVv0jhPM4lCXJh6UcJ0ghvrPUUXODqniFLsBD~kB5er~F-LUbhb0sVM7OLhtI3gFzd5DeJi9WC-mfARMpYvBNeyeQ8AmMSOrhZsfRRNWKvqq1UcluK0YvodZlg3B0O-IFRRWEKdhsk3ZPy8yGQ9GZPug0cPlrtxgL9eEhkWzfIXWnxrAue5KPeGUL0pRlpJfgyzdDU4JcDirP5PNtcLzQYyUC7uCYV3wqaqmkhfwK6ENRR2Ux8cV0MPeOPGn-ItlvTZeq74o62W3ca2OfXbsaF5UPRbFj11uxYkVqge4fRZcKqa0eMHZkDeuew3cEeTvzF78jIRyi-s-pD5msiQ__',
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
                  unselectedItemColor: Color(0xFF484C52), //
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
      ),
    );
  }
}
