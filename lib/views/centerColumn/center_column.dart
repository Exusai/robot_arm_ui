import 'package:flutter/material.dart';
import 'package:robot_arm_ui/views/centerColumn/video_view.dart';

class CenterColumn extends StatefulWidget {
  const CenterColumn({Key? key}) : super(key: key);

  @override
  State<CenterColumn> createState() => _CenterColumnState();
}

class _CenterColumnState extends State<CenterColumn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 385,
      width: 512,
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: const VideoView(),
    );
  }
}