import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktokclone/Widgets/SlideTransition.dart';
import 'package:video_player/video_player.dart';

class VideoDetail extends StatelessWidget {
  final String videourl;
  final VideoPlayerController controller;
  const VideoDetail(
      {super.key, required this.videourl, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Hero(
            tag: videourl,
            child: VideoPlayer(controller),
          ),
          Positioned(
              bottom: 0.h,
              child: SlideFadeTransition(
                delayStart: const Duration(milliseconds: 200),
                child: Container(
                  height: 60.h,
                  width: MediaQuery.of(context).size.width.w,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.7),
                        spreadRadius: 30.r,
                        blurRadius: 80.r)
                  ]),
                ),
              )),
          Positioned(
            bottom: 12.h,
            left: 12.w,
            right: 12.w,
            child: SlideFadeTransition(
              delayStart: const Duration(milliseconds: 300),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "@deep",
                    style: GoogleFonts.mulish(
                        fontSize: 13.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    "In the quiet embrace of dawn, the sun's tender rays kissed the dew-laden petals, awakening the slumbering garden. Nature's canvas unfolded, a symphony of colors danced harmoniously, whispering tales of resilience and beauty, a serene testament to life's enduring grace.",
                    style: GoogleFonts.mulish(
                        fontSize: 11.sp,
                        color: Colors.white.withOpacity(0.7),
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
