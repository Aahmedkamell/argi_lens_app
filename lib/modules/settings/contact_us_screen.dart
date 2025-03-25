import 'package:agre_lens_app/shared/cubit/contact_us_cubit.dart';
import 'package:agre_lens_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactUsCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Contact Us",
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: ColorManager.blackColor,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
                color: ColorManager.blackColor, size: 28),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: BlocBuilder<ContactUsCubit, Map<String, dynamic>>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 40),
                    Text(
                      state["subText"],
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: ColorManager.blackColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 25),
                    Icon(FontAwesomeIcons.phone,
                        color: ColorManager.greenColor, size: 28),
                    SizedBox(height: 8),
                    Text(state["phone"],
                        style: GoogleFonts.poppins(
                            fontSize: 12, fontWeight: FontWeight.w500)),
                    SizedBox(height: 25),
                    Icon(Icons.email, color: ColorManager.greenColor, size: 28),
                    SizedBox(height: 8),
                    Text(state["email"],
                        style: GoogleFonts.poppins(
                            fontSize: 12, fontWeight: FontWeight.w500)),
                    SizedBox(height: 25),
                    Icon(Icons.location_on,
                        color: ColorManager.greenColor, size: 28),
                    SizedBox(height: 8),
                    Text(state["location"],
                        style: GoogleFonts.poppins(
                            fontSize: 12, fontWeight: FontWeight.w500)),
                    SizedBox(height: 70),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.twitter,
                            color: ColorManager.greenColor, size: 32),
                        SizedBox(width: 40),
                        Icon(FontAwesomeIcons.instagram,
                            color: ColorManager.greenColor, size: 32),
                        SizedBox(width: 40),
                        Icon(FontAwesomeIcons.facebook,
                            color: ColorManager.greenColor, size: 32),
                      ],
                    ),
                    SizedBox(height: 40),
                    Text(
                      "Any question or remarks?\nJust write us a message!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorManager.secondDarkGreenColor,
                      ),
                    ),
                    SizedBox(height: 25),
                    TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: "Write your message...",
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.secondDarkGreenColor)),
                    ),
                    SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.greenColor,
                        padding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 80),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Send Message",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
