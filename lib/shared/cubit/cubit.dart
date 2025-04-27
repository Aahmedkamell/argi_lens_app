import 'dart:math';

import 'package:agre_lens_app/modules/history/history_screen.dart';
import 'package:agre_lens_app/modules/home/home_screen.dart';
import 'package:agre_lens_app/modules/scan/scan_screen.dart';
import 'package:agre_lens_app/modules/settings/settings_screen.dart';
import 'package:agre_lens_app/modules/timer/timer_screen.dart';
import 'package:agre_lens_app/shared/cubit/states.dart';
import 'package:agre_lens_app/shared/styles/colors.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppCubit extends Cubit<AppStates> {

  AppCubit() : super(AppInitialStates()) {
    hourController = FixedExtentScrollController(initialItem: selectedHour);
    minuteController = FixedExtentScrollController(initialItem: selectedMinute);
    _init();
    listenToFarmData();
  }

  void _init() async {
    await loadSavedTimer();
  }

  static AppCubit get(BuildContext context) => BlocProvider.of(context);


  //firebase real time reading

  final DatabaseReference farmRef = FirebaseDatabase.instance.ref('farm');

  String soilMoisture = '';
  String temp = '';

  void listenToFarmData() {
    farmRef.onValue.listen((event) {
      var data = event.snapshot.value as Map<dynamic, dynamic>?;

      if (data != null) {
        // قراءة الثلاث قيم
        int soil1 = int.tryParse(data['SoilMoisture1'].toString()) ?? 0;
        int soil2 = int.tryParse(data['SoilMoisture2'].toString()) ?? 0;
        int soil3 = int.tryParse(data['SoilMoisture3'].toString()) ?? 0;

        // نحسب الافرج
        int avgSoilMoisture = ((soil1 + soil2 + soil3) / 3).round();

        // نحط الافرج
        soilMoisture = avgSoilMoisture.toString();

        temp = data['temp'].toString(); // عادي temp زي ما هي

        emit(FarmDataUpdated());
      }
    });
  }


  //

  String selectedButton = '';
  String selectedButton2 = '';

  String startDate = "Select Start";
  String endDate = "Select End";

  DateTimeRange? selectedDateRange;
  void setDateRange(DateTimeRange range) {
    selectedDateRange = range;
    startDate = DateFormat('dd MMM yyyy').format(range.start);
    endDate = DateFormat('dd MMM yyyy').format(range.end);
    resetFilter();

    emit(DateRangeUpdatedState()); // تأكد من وجود هذه الحالة
  }
  void clearDateRange() {
    selectedDateRange = null;
    startDate = "Select Start";
    endDate = "Select End";
    emit(DateRangeClearedState()); // تأكد من إضافة الحالة
  }

  // تحقق إذا كانت القيم كلها فارغة (أي القيم الافتراضية)
  bool get isDefault => selectedButton.isEmpty && selectedButton2.isEmpty && startDate == "Select Start" && endDate == "Select End";

  // اختيار زر أول
  void selectButton(String text) {
    if (selectedButton != text) {
      selectedButton = text;
      emit(ButtonChangeState());  // تحديث الـ UI بعد التغيير
    }
  }

  void selectButton2(String text) {
    if (selectedButton2 != text) {
      selectedButton2 = text;
      emit(ButtonChangeState());  // تحديث الـ UI بعد التغيير
    }
  }


  // تغيير حالة الـ BottomSheet
  void changeBottomSheetState({required bool isShow}) {
    if (isBottomSheetShown != isShow) {  // تأكد من عدم تحديث الحالة بدون داعي
      isBottomSheetShown = isShow;
      emit(ButtonChangeState());  // إرسال حالة جديدة لإعادة بناء الواجهة
    }
  }

  // إعادة تعيين الفلتر الأول
  void resetFilter() {
    if (selectedButton.isNotEmpty) {  // تحقق من أنه ليس فارغًا
      selectedButton = '';  // إعادة التعيين إلى قيمة فارغة
      emit(AppChangeFilterState());
    }
  }

  // إعادة تعيين الفلتر الثاني
  void resetFilter2() {
    if (selectedButton2.isNotEmpty) {  // تحقق من أنه ليس فارغًا
      selectedButton2 = '';  // إعادة التعيين إلى قيمة فارغة
      emit(AppChangeFilterState());
    }
  }





  int healthPlantPrecentage = 45;

  void updateHealth(int newHealth) {
    healthPlantPrecentage = newHealth;
    emit(AppHealthUpdatedState());
  }

  bool isBottomSheetShown = false;

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
