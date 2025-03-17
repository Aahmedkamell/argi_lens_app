import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const int infiniteScrollCount = 100000;
    const int middleIndex = infiniteScrollCount ~/ 2;

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return Padding(
          padding: const EdgeInsets.only(left: 22),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('My Farm',
                  style: GoogleFonts.reemKufi(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF414042)
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(right: 23),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Color(0xFF414042)),
                      hintText: "Search",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF414042),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Color(0xFF414042)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Color(0xFF414042)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Color(0xFF414042), width: 1.5),
                      ),
                    ), cursorColor: Color(0xFF414042),
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Text('Your Plants Health',
                        style: GoogleFonts.reemKufi(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF414042)
                        ),
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_right, color: Color(0xFF414042),)
                  ],
                ),
                const SizedBox(height: 10,),
                SizedBox(height: 150,child: healthPlantBuilder(),),
                const SizedBox(height: 20,),
                WillPopScope(
                  onWillPop: () async {
                    cubit.resetTimer(); // إعادة القيم الافتراضية عند الخروج
                    return true;
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        'Set time',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // العناوين
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("H", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                          SizedBox(width: 155),
                          Text("M", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // التايمر
                      Container(
                        height: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // ساعات
                            Expanded(
                              child: ListWheelScrollView.useDelegate(
                                controller: FixedExtentScrollController(initialItem: middleIndex + cubit.selectedHour),
                                itemExtent: 50,
                                physics: FixedExtentScrollPhysics(),
                                onSelectedItemChanged: (index) {
                                  cubit.changeHour(index % 24);
                                },
                                childDelegate: ListWheelChildBuilderDelegate(
                                  builder: (context, index) {
                                    int hour = index % 24;
                                    return Text(
                                      hour.toString().padLeft(2, '0'),
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: hour == cubit.selectedHour ? FontWeight.bold : FontWeight.normal,
                                        color: hour == cubit.selectedHour ? Colors.black : Colors.grey,
                                      ),
                                    );
                                  },
                                  childCount: infiniteScrollCount,
                                ),
                              ),
                            ),

                            SizedBox(width: 20),

                            // دقائق
                            Expanded(
                              child: ListWheelScrollView.useDelegate(
                                controller: FixedExtentScrollController(initialItem: middleIndex + cubit.selectedMinute),
                                itemExtent: 50,
                                physics: FixedExtentScrollPhysics(),
                                onSelectedItemChanged: (index) {
                                  cubit.changeMinute(index % 60);
                                },
                                childDelegate: ListWheelChildBuilderDelegate(
                                  builder: (context, index) {
                                    int minute = index % 60;
                                    return Text(
                                      minute.toString().padLeft(2, '0'),
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: minute == cubit.selectedMinute ? FontWeight.bold : FontWeight.normal,
                                        color: minute == cubit.selectedMinute ? Colors.black : Colors.grey,
                                      ),
                                    );
                                  },
                                  childCount: infiniteScrollCount,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
