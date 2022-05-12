import 'package:flutter_number_picker/flutter_number_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/robot.dart';

class NumberPicker extends StatefulWidget {
  const NumberPicker({Key? key}) : super(key: key);

  @override
  State<NumberPicker> createState() => _NumberPickerState();
}

class _NumberPickerState extends State<NumberPicker> {
  @override
  Widget build(BuildContext context) {
    final Robot robot = context.watch<Robot?>()!;
    
    return CustomNumberPicker(
      initialValue: 1,
      maxValue: 30,
      minValue: 1,
      step: 1,
      onValue: (num value) {
        setState(() {
          robot.addBoxesTotake(value.toInt());
          print(robot.boxesTotake);
        });
      },
    );
  }
}