import 'package:flutter/material.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';
import 'package:provider/provider.dart';

import '../../controllers/robot.dart';

class VideoViewerGeneral extends StatefulWidget {
  const VideoViewerGeneral({Key? key}) : super(key: key);

  @override
  State<VideoViewerGeneral> createState() => _VideoViewerGeneralState();
}

class _VideoViewerGeneralState extends State<VideoViewerGeneral> {
  
  @override
  Widget build(BuildContext context) {
    final Robot robot = context.watch<Robot?>()!;
    final String streamURL = robot.robotServer + ':8080/stream?topic=/image_raw';
    return Mjpeg(
      stream: streamURL,
      isLive: true,
      timeout: const Duration(seconds: 30),
      height: 512,
      width: 512,
    );
  }
}