import 'dart:math';

import 'package:agre_lens_app/shared/styles/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/components/components.dart';
import '../../../shared/cubit/cubit.dart';
import '../../../shared/cubit/states.dart';



class ReportScreen extends StatefulWidget  {
  final int reportNum;
  final int serialNum;
  final int healthPrecentage;
  ReportScreen({Key? key, required this.reportNum, required this.serialNum, required this.healthPrecentage}) : super(key: key);


  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  DateTimeRange? selectedDateRange;
  TimeOfDay? selectedTime;

  Future<void> _pickDateRange() async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialEntryMode: DatePickerEntryMode.input, // يتيح تغيير السنة بسهولة
      helpText: "Select a Date Range", // نص توضيحي في الأعلى
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.green, // اللون الأساسي للأزرار والعناصر
            hintColor: Colors.green, // لون التلميحات
            scaffoldBackgroundColor: Colors.green.shade50, // خلفية الشاشة (فاتحة)
            colorScheme: ColorScheme.light(
              primary: Colors.green, // لون التحديد الأساسي
              onPrimary: Colors.white, // لون النص فوق الزر الأخضر
              primaryContainer: Colors.green.shade300, // ✅ لون التظليل بين التواريخ المختارة
              onPrimaryContainer: Colors.white, // لون النصوص داخل التظليل
              secondary: Colors.green.shade300, // لون الزر الثانوي
            ), // نظام الألوان العام

            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.green.shade900, // لون نص الأزرار
              ),
            ),

            textSelectionTheme: TextSelectionThemeData(
              cursorColor: Colors.green, // لون مؤشر الكتابة
              selectionColor: Colors.green.shade900, // لون النص المحدد
              selectionHandleColor: Colors.green, // لون مؤشر التحديد
            ),

            dialogBackgroundColor: Colors.green.shade100,
            dialogTheme: DialogTheme(
              titleTextStyle: TextStyle(
                color: Colors.green, // ✅ لون العنوان "Select a Date Range"
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              contentTextStyle: TextStyle(
                color: Colors.green.shade800, // ✅ لون باقي النصوص داخل النافذة
              ),
            ),// لون خلفية الـ DatePicker
            buttonTheme: ButtonThemeData(
              buttonColor: Colors.green, // لون الأزرار القديمة (للتوافق مع إصدارات قديمة)
              textTheme: ButtonTextTheme.primary,
            ),

            inputDecorationTheme: InputDecorationTheme(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green, width: 2), // عند التركيز
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green, width: 1.5), // بدون تركيز
              ),
              labelStyle: TextStyle(color: Colors.green.shade700), // لون النصوص في الحقول
              hintStyle: TextStyle(color: Colors.green.shade900), // لون التلميحات
            ),

            appBarTheme: AppBarTheme(
              backgroundColor: Colors.green, // لون شريط العنوان
              foregroundColor: Colors.white, // لون النصوص والأيقونات في الـ AppBar
            ),

            iconTheme: IconThemeData(color: Colors.green), // لون الأيقونات داخل DatePicker
          ),
          child: child != null
              ? DefaultTextStyle(
            style: TextStyle(
              color: Colors.green, // ✅ لون جميع النصوص داخل Date Picker
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            child: child,
          )
              : SizedBox.shrink(),
          // يعرض الواجهة بحجمها الطبيعي
        );
      },
    );

    if (picked != null) {
      setState(() {
        selectedDateRange = picked;
      });
    }
  }

  Future<void> _pickTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.white, // اللون الرئيسي (العقارب، الدوائر)
              onPrimary: Colors.white, // لون النص داخل الدوائر
              surface: Color(0xFFFEF7FF), // لون الخلفية
              onSurface: Colors.green.shade900, // لون النصوص العامة
            ),
            timePickerTheme: TimePickerThemeData(
              backgroundColor: Color(0xFFFEF7FF), // لون الخلفية
              hourMinuteColor: Colors.green[100], // لون الأرقام الكبيرة
              hourMinuteTextColor: Colors.green.shade900, // لون نص الأرقام الكبيرة
              dialHandColor: Colors.green.shade600, // لون العقرب
              dialBackgroundColor: Colors.green[100], // لون الدائرة
              //dialTextColor: MaterialStateColor.resolveWith((states) => Colors.green.shade900), // لون أرقام الدائرة
              helpTextStyle: TextStyle(color: Colors.green.shade900, fontWeight: FontWeight.bold),
              dayPeriodColor: MaterialStateColor.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return Colors.green.shade700; // لون عند التحديد
                }
                return Colors.white; // لون العادي
              }),
              dayPeriodTextColor: MaterialStateColor.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return Colors.white; // لون النص عند التحديد
                }
                return Colors.green.shade900; // لون النص العادي
              }),// لون نص "Select Time"
            ),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: Colors.green,
              selectionHandleColor: Colors.green,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.green.shade900, // لون أزرار "Cancel" و "OK"
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit, AppStates>(
    listener: (context, state) {},
    builder: (context, state) {
      var cubit = AppCubit.get(context);
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: () {
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
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.17,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [BoxShadow(
                          color: Color(0x26000000),
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        ),
                        ],
                        color: Color(0xFFFEF7FF),
                        border: Border.all(color: Color(0xFFD9D9D9), width: 1)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Report ${widget.reportNum}',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Report Serial',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black45,
                                  ),
                                ),
                                Text(
                                  '${widget.serialNum}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF26273A),
                                  ),
                                ),
                                Expanded(
                                  child: Row(children: [
                                    Text(
                                      '02 Jan 2025',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: Color(0x9926273A)
                                      ),
                                    ),
                                    SizedBox(width: 8,),
                                    Text(
                                      '11:00 AM',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: Color(0x9926273A)
                                      ),
                                    ),
                                  ],),
                                )
                              ],
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/images/plant health.jpeg',
                              width: MediaQuery.of(context).size.height * 0.17*0.8,
                              height: MediaQuery.of(context).size.height * 0.17*0.8,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.17+10),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 20,),
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  _buildDateRangePicker(
                                      context, selectedDateRange, _pickDateRange),
                                  SizedBox(width: 10),
                                  _buildTimePicker(context, selectedTime, _pickTime),

                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Transform.translate(
                                      offset: Offset(0, 8),
                                      child: Text(
                                        'Last data',
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF26273A)
                                        ),
                                        textHeightBehavior: TextHeightBehavior(
                                          applyHeightToFirstAscent: false,
                                          applyHeightToLastDescent: false,
                                        ),
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                          text: '${widget.healthPrecentage}',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 46,
                                              color: Color(0xFF484C52)
                                          ),
                                          children: [
                                            TextSpan(
                                              text: '%',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 19,
                                                  color: Color(0xFF484C52)
                                              ),
                                            )
                                          ]
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: SizedBox(
                                          width: MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context).size.height * 0.25,
                                          child: buildChart()),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 44,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [Color(0xFFE0E0E0), Color(0xFFF5F5F5)],
                                        // تدرج من الرمادي للأبيض
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        stops: [0.2, 1.0]
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.15),
                                        // الظل الخارجي
                                        offset: Offset(4, 4),
                                        blurRadius: 4,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Average",
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: ColorManager.greenColor,
                                        ),
                                      ),
                                      Text(
                                        "75%",
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: ColorManager.greenColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 44,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [Color(0xFFE0E0E0), Color(0xFFF5F5F5)],
                                        // تدرج من الرمادي للأبيض
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        stops: [0.2, 1.0]
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.15),
                                        // الظل الخارجي
                                        offset: Offset(4, 4),
                                        blurRadius: 4,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Maximum",
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: ColorManager.greenColor,
                                        ),
                                      ),
                                      Text(
                                        "95%",
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: ColorManager.greenColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 44,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [Color(0xFFE0E0E0), Color(0xFFF5F5F5)],
                                        // تدرج من الرمادي للأبيض
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        stops: [0.2, 1.0]
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.15),
                                        // الظل الخارجي
                                        offset: Offset(4, 4),
                                        blurRadius: 4,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Minimum",
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: ColorManager.greenColor,
                                        ),
                                      ),
                                      Text(
                                        "50%",
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: ColorManager.greenColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: detailesText(
                                  headColor: Color(0xFF484C52),
                                  headText: 'Status:',
                                  bodyText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra condimentum eget purus in. Consectetur eget id morbi amet amet, in. Ipsum viverra pretium tellus neque. Ullamcorper suspendisse aenean leo pharetra in sit semper et. Amet quam placerat sem.',
                                ),
                              ),
                              SizedBox(height: 15,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: detailesText(
                                  headColor: Color(0xFF484C52),
                                  headText: 'Recommendation:',
                                  bodyText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra condimentum eget purus in. Consectetur eget id morbi amet amet, in. Ipsum viverra pretium tellus neque. Ullamcorper suspendisse aenean leo pharetra in sit semper et. Amet quam placerat sem.',
                                ),
                              ),
                              SizedBox(height: 15,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
    }
  }



Widget buildChart() {
  Random random = Random();
  List<FlSpot> spots = [];

  double yValue = 75;

  for (double x = 1; x < 60; x += 2) {
    yValue += random.nextDouble() * 10 - 5;
    yValue = yValue.clamp(50, 100);
    spots.add(FlSpot(x, yValue));
  }

  return LineChart(
    LineChartData(
      minX: 1,
      maxX: 59,
      minY: 45,
      maxY: 105,

      // تفعيل اللمس وإضافة التولتيب
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipRoundedRadius: 0, // إزالة الزوايا المستديرة
          tooltipPadding: EdgeInsets.zero, // إزالة الحواف
          tooltipMargin: 0, // إزالة المسافات
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((spot) {
              return LineTooltipItem(
                '${spot.y.toStringAsFixed(1)}%', // عرض القيمة فقط
                const TextStyle(
                  color: ColorManager.greenColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Color(0xFFFEF7FF),
                  height: 1.5,
                ),
              );
            }).toList();
          },
        ),
      ),







      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        drawHorizontalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.grey.withOpacity(0.5),
            strokeWidth: 1,
            dashArray: [4, 4],
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.grey.withOpacity(0.3),
            strokeWidth: 1,
            dashArray: [4, 4],
          );
        },
        checkToShowHorizontalLine: (value) {
          return value == 100 || (value % 10 == 0 && value >= 50 && value < 100);
        },
      ),

      titlesData: FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            getTitlesWidget: (value, meta) {
              if (value % 10 == 0 && value >= 50 && value <= 100) {
                return Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    '${value.toInt()}%',
                    style: GoogleFonts.archivo(fontSize: 10, color: Colors.grey),
                  ),
                );
              }
              return Container();
            },
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 20,
            interval: 10,
            getTitlesWidget: (value, meta) {
              if (value >= 10 && value % 10 == 0) {
                int seconds = value.toInt();
                String formattedTime = "0:${seconds.toString().padLeft(2, '0')}";

                return Text(
                  formattedTime,
                  style: GoogleFonts.archivo(fontSize: 10, color: Colors.grey),
                  textAlign: TextAlign.center,
                );
              }
              return Container();
            },
          ),
        ),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),

      borderData: FlBorderData(show: false),
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          color: Colors.green,
          barWidth: 2,
          isStrokeCapRound: true,
          belowBarData: BarAreaData(show: false),
          dotData: FlDotData(show: false),
        ),
      ],
    ),
  );


}

Widget _buildDateRangePicker(BuildContext context,DateTimeRange? selectedDateRange, VoidCallback pickDateRange) {
  return GestureDetector(
    onTap: pickDateRange,
    child: Container(
      height: MediaQuery.of(context).size.height*0.04,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            selectedDateRange != null
                ? "${selectedDateRange.start.toString().split(' ')[0]} - ${selectedDateRange.end.toString().split(' ')[0]}"
                : "Select Date",
            style: TextStyle(color: Colors.grey.shade700),
          ),
          SizedBox(width: 3,),
          Icon(Icons.calendar_today, color: Colors.grey,size: 16,),
        ],
      ),
    ),
  );
}

Widget _buildTimePicker(BuildContext context, TimeOfDay? selectedTime, VoidCallback pickTime) {
  return InkWell(
    onTap: pickTime,
    borderRadius: BorderRadius.circular(8), // تأثير الضغط
    child: SizedBox(
      height: MediaQuery.of(context).size.height*0.04,
      width: MediaQuery.of(context).size.width * 0.3, // تقليل العرض حسب الحاجة
      child: Container(
        padding: EdgeInsets.all(4), // تصغير الحواف بشكل متناسق
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // توسيط المحتوى
          children: [
            Text(
              selectedTime != null ? selectedTime.format(context) : "Select Time",
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 14, // تصغير الخط قليلًا
              ),
            ),
            SizedBox(width: 4), // تقليل المسافة بين النص والأيقونة
            Icon(Icons.access_time, color: Colors.grey, size: 16), // تصغير الأيقونة قليلًا
          ],
        ),
      ),
    ),
  );
}




