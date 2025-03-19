import 'dart:ui';

import 'package:agre_lens_app/modules/all%20plants/all_plant_screen.dart';
import 'package:agre_lens_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is TimerSavedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Timer updated!',
              style: TextStyle(fontSize: 16),
              ),
              duration: Duration(seconds: 1),
              backgroundColor: ColorManager.greenColor,
            ),
          );
        }
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Padding(padding: EdgeInsets.only(left: 22),
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
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllPlantScreen()),
                        );
                      },
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
                const SizedBox(height: 5,),
                Row(
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Text('All Floors',
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
                SizedBox(height: 160,child: floorPlantBuilder(),),
                const SizedBox(height: 10,),
                Text('Sensors Reading',
                  style: GoogleFonts.reemKufi(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF414042)
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(right: 20,bottom: 10),
                  child: Row(
                    children: [
                      sensorReading(sensorName: 'Water', sensorStats: 92),
                      SizedBox(width: 10,),
                      sensorReading(sensorName: 'PH', sensorStats: 96),
                      SizedBox(width: 10,),
                      sensorReading(sensorName: 'DHT', sensorStats: 94),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
