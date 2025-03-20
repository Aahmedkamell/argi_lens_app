import 'package:agre_lens_app/modules/history/history_screen.dart';
import 'package:agre_lens_app/modules/home/home_screen.dart';
import 'package:agre_lens_app/modules/scan/scan_screen.dart';
import 'package:agre_lens_app/modules/settings/settings_screen.dart';
import 'package:agre_lens_app/modules/timer/timer_screen.dart';
import 'package:agre_lens_app/shared/cubit/states.dart';
import 'package:agre_lens_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());

  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  int currentIndex = 0;

  final List<Widget> screens = [
    HomeScreen(),
    TimerScreen(),
    ScanScreen(),
    HistoryScreen(),
    SettingsScreen(),
  ];

  final List<String> svgIcons = [
    'assets/icons/home.svg',
    'assets/icons/timer.svg',
    'assets/icons/scan.svg',
    'assets/icons/history.svg',
    'assets/icons/settings.svg',
  ];

  final List<String> labels = ['Home', 'Timer', '', 'History', 'Settings'];

  void changeNavBarIndex(int index) {
    currentIndex = index;
    emit(AppBottomNavState());
  }

  List<BottomNavigationBarItem> get bottomItems {
    return List.generate(svgIcons.length, (index) {
      final bool isSelected = currentIndex == index;

      return BottomNavigationBarItem(
        icon: index == 2
            ? Container(
                height: 52,
                width: 52,
                decoration: BoxDecoration(
                  color: ColorManager.greenColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    svgIcons[index],
                    width: 24,
                    height: 24,
                  ),
                ),
              )
            : SvgPicture.asset(
                svgIcons[index],
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  isSelected ? ColorManager.greenColor : const Color(0xFF484C52),
                  BlendMode.srcIn,
                ),
              ),
        label: labels[index],
      );
    });
  }
}
