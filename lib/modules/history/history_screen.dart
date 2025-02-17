import 'package:agre_lens_app/modules/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';
import '../../shared/styles/colors.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
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
            centerTitle: true,
            title: Text(
              "History",
              style: TextStyle(
                color: ColorManager.blackColor,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            actions: [
              IconButton(
                onPressed: (){},
                icon: SvgPicture.asset(
                  'assets/icons/settings.svg',
                  width: 28,
                  height: 22.6,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: IconButton(
                  onPressed: (){},
                  icon: SvgPicture.asset(
                    'assets/icons/check.svg',
                    width: 28,
                    height: 22.6,
                  ),
                ),
              ),
            ],
          ),
          body: Center(
            child: Text(
              'History',
              style: TextStyle(
                  fontSize: 25
              ),
            ),
          ),
        );
      },
    );
  }
}
