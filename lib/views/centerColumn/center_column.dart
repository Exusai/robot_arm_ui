import 'package:flutter/material.dart';
import 'package:robot_arm_ui/views/centerColumn/video_view.dart';

class CenterColumn extends StatelessWidget {
  const CenterColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          VideoView(),
        ],
      ),
    );
  }
}