import 'package:flutter/material.dart';
import 'package:robot_arm_ui/views/centerColumn/video_view.dart' if (dart.library.html) 'package:robot_arm_ui/views/centerColumn/video_view_web_and_mobile.dart' as multi_platform;
/* import 'dart:io' show Platform; */


class CenterColumn extends StatefulWidget {
  const CenterColumn({Key? key}) : super(key: key);

  @override
  State<CenterColumn> createState() => _CenterColumnState();
}

class _CenterColumnState extends State<CenterColumn> {
  @override
  Widget build(BuildContext context) {
    /* bool mobile = true;

    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) { mobile = false; }
    else { mobile = true; } */

    return Container(
      height: 385,
      width: 512,
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: const multi_platform.VideoView(),
    );
  }
}