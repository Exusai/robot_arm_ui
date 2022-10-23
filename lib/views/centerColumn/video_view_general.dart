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
    String streamURL = robot.robotServer + ':8080/stream?topic=/gripper_cam';
    return Mjpeg(
      stream: streamURL,
      isLive: true,
      timeout: const Duration(seconds: 10),
      height: 512,
      width: 512,
      error: (contet, error, stack) {
        return const SizedBox(
          height: 512,
          width: 512,
          child: Center(child: Text('Error, no hay conexión con el robot'),),
        );
      },
      loading: (context) {
        return const SizedBox(
          height: 512,
          width: 512,
          child: Center(child: CircularProgressIndicator(),),
        );
      },
    );
  }
}