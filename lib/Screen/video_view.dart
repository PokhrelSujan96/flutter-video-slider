// ignore_for_file: prefer_const_constructors, constant_identifier_names
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktokclone/Models/Video_Models.dart';
import 'package:tiktokclone/Screen/Video_player.dart';
import 'package:tiktokclone/Widgets/RotatedText.dart';
import 'package:tiktokclone/Widgets/SlideTransition.dart';

const fraction = 0.7;
const slide_scale = 1.0;
const slideHeight = 400.0;

class VideoView extends StatefulWidget {
  @override
  _VideoViewState createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  double viewPortFraction = 0.5;

  late PageController pageController;

  int currentPage = 1;

  double page = 1.0;

  @override
  void initState() {
    pageController = PageController(
        initialPage: currentPage, viewportFraction: viewPortFraction);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
           
            Positioned(
              right: 50.w,
              top: 0.h,
              bottom: -0.h,
              child: RotatedText(text: "EXPRESS", turn: 0)
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SlideFadeTransition(
                  delayStart: const Duration(milliseconds: 300),
                  direction: Direction.vertical,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 12.h,
                      ),
                      Text(
                        "Custom Video Slider".toUpperCase(),
                        style: GoogleFonts.mulish(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Simple video slide player created using flutter",
                        style: GoogleFonts.mulish(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 10.sp),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: slideHeight,
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification notification) {
                      if (notification is ScrollUpdateNotification) {
                        setState(() {
                          page = pageController.page!;
                        });
                      }
                      return true;
                    },
                    child: PageView.builder(
                      onPageChanged: (pos) {
                        setState(() {
                          currentPage = pos;
                        });
                      },
                      physics: const BouncingScrollPhysics(),
                      controller: pageController,
                      itemCount: videoData.length,
                      itemBuilder: (context, index) {
                        final scale = max(
                            fraction,
                            (slide_scale - (index - page).abs()) +
                                viewPortFraction);
                        return videoSlide(videoData[index]['video']!, scale);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget videoSlide(String image, double scale) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Container(
          height: slideHeight * scale,
          child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Colors.white)),
              child: CustomVideoPlayer(
                videoUrl: image,
              )),
        ),
      ),
    );
  }
}
