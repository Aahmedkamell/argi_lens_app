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
import 'package:shared_preferences/shared_preferences.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates()){
    hourController = FixedExtentScrollController(initialItem: selectedHour);
    minuteController = FixedExtentScrollController(initialItem: selectedMinute);
    _init();
  }
  void _init() async {
    await loadSavedTimer();
  }

  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  int healthPlantPrecentage = 45;

  void updateHealth(int newHealth) {
    healthPlantPrecentage = newHealth;
    emit(AppHealthUpdatedState());
  }


  var emailController = TextEditingController(text: 'acc.motharwat@gmail.com');
  var passwordController = TextEditingController(text: '************');
  var userNameController = TextEditingController(text: 'Mohamed Tharwat');
  var farmNameController = TextEditingController(text: 'My Farm');


  int selectedHour = 1;
  int selectedMinute = 0;

  int savedHour = 1;
  int savedMinute = 0;

  late FixedExtentScrollController hourController;
  late FixedExtentScrollController minuteController;

  Future<void> loadSavedTimer() async {
    final prefs = await SharedPreferences.getInstance();

    savedHour = prefs.getInt('savedHour') ?? 1;
    savedMinute = prefs.getInt('savedMinute') ?? 0;

    selectedHour = savedHour;
    selectedMinute = savedMinute;

    // تحديث المؤشرات بدون إعادة التهيئة
    hourController.jumpToItem(selectedHour);
    minuteController.jumpToItem(selectedMinute);

    emit(TimerResetState()); // تحديث الواجهة
  }

  Future<void> saveTimer() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('savedHour', selectedHour);
    await prefs.setInt('savedMinute', selectedMinute);

    savedHour = selectedHour;
    savedMinute = selectedMinute;

    emit(TimerSavedState()); // إرسال حالة الحفظ
  }





  void updateHour(int hour) {
    selectedHour = hour;
    emit(AppUpdateTimeState());
  }

  void updateMinute(int minute) {
    selectedMinute = minute;
    emit(AppUpdateTimeState());
  }

  void resetTimer() {
    selectedHour = savedHour;
    selectedMinute = savedMinute;

    hourController.jumpToItem(selectedHour);
    minuteController.jumpToItem(selectedMinute);

    emit(TimerResetState());
  }



  int currentIndex = 0;

<<<<<<< HEAD
  final List<Widget> screens = [
    HomeScreen(),
    TimerScreen(),
    ScanScreen(),
    HistoryScreen(),
    SettingsScreen(),
=======
  List<Widget> screens = [
    const HomeScreen(),
    TimerScreen(),
    const ScanScreen(),
    const HistoryScreen(),
    const SettingsScreen()
>>>>>>> 0667b57e3d013ee77b3ccbb51954e46bc7ad650e
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
