import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktokclone/Screen/Video_details.dart';

import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const CustomVideoPlayer({
    Key? key,
    required this.videoUrl,
  }) : super(key: key);

  @override
  _CustomVideoPlayerState createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController _videoController;

  late Future<void> _initializeVideoPlayer;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer = _initVideoPlayer();
  }

  Future<void> _initVideoPlayer() async {
    _videoController = VideoPlayerController.asset(widget.videoUrl,
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true));

    await _videoController.initialize();
    _videoController.setLooping(true);
    _videoController.play();
    _videoController.setVolume(1);
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder(
          future: _initializeVideoPlayer,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Center(
                child: Hero(
                  tag: widget.videoUrl,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height.h,
                    width: MediaQuery.of(context).size.width.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: AspectRatio(
                        aspectRatio: _videoController.value.aspectRatio,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VideoDetail(
                                    videourl: widget.videoUrl,
                                    controller: _videoController,
                                  ),
                                ),
                              );
                            },
                            child: VideoPlayer(_videoController)),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Center(
                child: SizedBox(
                    height: 30.h,
                    child: Image.asset(
                      "assets/defaultimage.png",
                      color: Colors.grey.shade600,
                    )),
              );
            }
          },
        ),
      ],
    );
  }
}
