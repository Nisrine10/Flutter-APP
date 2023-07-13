import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerItem({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late final String video;
  late VideoPlayerController videoPlayerController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget.videoUrl)..initialize().then((value){
      videoPlayerController.play();
      videoPlayerController.setVolume(1);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.width*1.5,
      width: size.height,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: VideoPlayer(
        videoPlayerController
      ),
    );
  }
}
