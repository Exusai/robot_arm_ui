import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/robot.dart';

class StatusConsole extends StatefulWidget {
  const StatusConsole({Key? key}) : super(key: key);

  @override
  State<StatusConsole> createState() => _StatusConsoleState();
}

class _StatusConsoleState extends State<StatusConsole> {
  @override
  Widget build(BuildContext context) {
    final Robot robot = context.watch<Robot?>()!;
    
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(10.0),
      height: 320,
      width: 400,
      child: Text(robot.logs,
        textAlign: TextAlign.left,
        maxLines: 10,
        style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 15.0, letterSpacing: 2.0,height: 1.5),
      ),
    );
  }
}