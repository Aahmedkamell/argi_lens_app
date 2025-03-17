import 'dart:ui';

import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles/colors.dart';

Widget defaultFormField({
  required BuildContext context,
  required TextEditingController controller,
  required TextInputType type,
  required String? Function(String?)? validator,
  Function(String)? onSubmit,
  Function(String)? onChanged,
  Function()? onTap,
  String? labelText,
  IconData? prefixIcon,
  Widget? suffixIcon,
  VoidCallback? suffixPressed,
  bool isPassword = false,
  bool isClickable = true,
}) => Theme(
      data: Theme.of(context).copyWith(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: ColorManager.greenColor,
          selectionColor: ColorManager.greenColor.withOpacity(0.5),
          selectionHandleColor: ColorManager.greenColor,
        ),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        enabled: isClickable,
        onFieldSubmitted: onSubmit,
        onTap: onTap,
        onChanged: onChanged,
        cursorColor: Colors.black,
        selectionControls: MaterialTextSelectionControls(),
        validator: validator,
        decoration: InputDecoration(
          errorMaxLines: 2,
          labelText: labelText,
          labelStyle: TextStyle(
            color: Color(0xFF475569),
          ),
          floatingLabelStyle: TextStyle(color: Colors.black),
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon,
          border: const UnderlineInputBorder(),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFCBD5E1)),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2.0),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.5),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
        ),
      ),
    );

Widget profileFormField({
  required String label,
  required TextEditingController controller,
  bool obscureText = false,
})=> Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      label,
      style: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        height: 0.88,
        letterSpacing: 0,
        color: Colors.black,
      ),
    ),
    const SizedBox(height: 8),
    Container(
      width: double.infinity,
      height: 44,
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Colors.grey),
        ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: Colors.black),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
        style: GoogleFonts.openSans(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  ],
);

Widget defaultButton({
  required Color? colorButton,
  required Color? textColorButton,
  required Widget? text,
  Function()? onTap,
}) => InkWell(
  onTap: onTap,
  child: Container(
        height: 36,
        width: double.infinity,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: colorButton
        ),
        child: Center(
        child: text
        ),
  ),
);

Widget buildHealthPlantItem()=> Column(
  children: [
    Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 104,
          width: 104,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
              child: Image.asset(
                'assets/images/plant health.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            border: Border.all(
                color: ColorManager.redColor
            ),
            shape: BoxShape.circle,
          ),
        ),
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              border: Border.all(
                  color: ColorManager.redColor
              ),
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.55)
          ),
        ),
        Text('45%',
          style: GoogleFonts.reemKufi(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Colors.black
          ),
        ),
      ],
    ),
    const SizedBox(height: 5,),
    Text('Floor 1\nCell 3',
      style: GoogleFonts.reemKufi(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Colors.black
      ),)
  ],
);

Widget healthPlantBuilder()=>BuildCondition(
  condition: true,
  builder: (context)=> ListView.separated(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(right: 10),
      itemBuilder: (context, index)=> buildHealthPlantItem(),
      separatorBuilder: (context, index)=> SizedBox(width: 15,),
      itemCount: 5),
  fallback: (context)=> Center(child: CircularProgressIndicator(
    color: ColorManager.greenColor,
  )),
);

Widget buildFloorPlantItem()=> Container(
  height: 152,
  width: 140,
  padding: EdgeInsets.only(right: 16,left: 16,top: 16),
  decoration: BoxDecoration(
    color: Color(0xFFFAFAFA),
    borderRadius: BorderRadius.circular(24),
    border: Border.all(color: ColorManager.greenColor),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.3),
        blurRadius: 4,
        offset: Offset(0, 4),
      ),
    ],
  ),
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          'assets/images/floor.jpeg',
          width: 112,
          height: 104,
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(height: 8),
      Row(
        children: [
          Expanded(
            child: Text(
              'Floor 1',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF414042),
              ),
            ),
          ),
          InkWell(
            onTap: (){},
            child: Container(
              width: 16,
              height: 16,
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                'assets/icons/arrow.svg',
              ),
            ),
          ),
        ],
      ),
    ],
  ),
);

Widget floorPlantBuilder()=>BuildCondition(
  condition: true,
  builder: (context)=> ListView.separated(
      clipBehavior: Clip.none,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(right: 10),
      itemBuilder: (context, index)=> buildFloorPlantItem(),
      separatorBuilder: (context, index)=> SizedBox(width: 15,),
      itemCount: 5),
  fallback: (context)=> Center(child: CircularProgressIndicator(
    color: ColorManager.greenColor,
  )),
);

Widget sensorReading ({
  required String? sensorName,
  required int? sensorStats,
})=> Container(
  height: 72,
  width: 99,
  decoration: BoxDecoration(
    color: Color(0xFFFAFAFA),
    borderRadius: BorderRadius.circular(10),
    border: Border.all(color: ColorManager.greenColor),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.3),
        blurRadius: 4,
        offset: Offset(0, 4),
      ),
    ],
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(
        vertical: 9,
        horizontal: 22
    ),
    child: Column(
      children: [
        Text(
          '$sensorName',
          style: TextStyle(
              color: Color(0xFF414042),
              fontSize: 18,
              fontWeight: FontWeight.w600
          ),
        ),
        Text(
          '$sensorStats%',
          style: TextStyle(
              color: ColorManager.greenColor,
              fontSize: 18,
              fontWeight: FontWeight.w600
          ),
        ),
      ],
    ),
  ),
);