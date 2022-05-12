import 'package:flutter/material.dart';
import 'package:robot_arm_ui/views/rightColumn/start_button.dart';
import 'package:robot_arm_ui/views/rightColumn/status_console.dart';

class RightColumn extends StatefulWidget {
  const RightColumn({Key? key}) : super(key: key);

  @override
  State<RightColumn> createState() => _RightColumnState();
}

class _RightColumnState extends State<RightColumn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          StatusConsole(),
          SizedBox(height:20),
          StartButton(),
        ],
      ),
    );
  }
}