import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RotatedText extends StatelessWidget {
  final String text;
  final int turn;
  const RotatedText({super.key, required this.text, required this.turn});

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
                quarterTurns: turn,
                child: Container(
                  width: MediaQuery.of(context).size.height.w,
                  height: 100.h,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Text(
                      text,
                      style: GoogleFonts.nunito(
                          color: Colors.grey.withOpacity(0.1),
                          fontWeight: FontWeight.bold,
                          fontSize: 72.sp),
                    ),
                  ),
                ),
              );
  }
}