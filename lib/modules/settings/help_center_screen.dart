import 'package:agre_lens_app/shared/cubit/help_center_cubit.dart';
import 'package:agre_lens_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpCenterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HelpCenterCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Help Center",
            style: GoogleFonts.poppins(
              color: ColorManager.blackColor,
              fontWeight: FontWeight.w500,
              fontSize: 20,
              height: 1.0,
              letterSpacing: 0,
            ),
          ),
         
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Frequently Asked Questions",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    height: 1.0,
                    letterSpacing: 0,
                    color:ColorManager.greenColor,
                  ),
                ),
              ),
              Expanded(
                child: BlocBuilder<HelpCenterCubit, List<String>>(
                  builder: (context, faqs) {
                    return ListView.builder(
                      itemCount: faqs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "${index + 1}. ${faqs[index]}",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              height: 1.0,
                              letterSpacing: 0,
                              color: ColorManager.blackColor,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
