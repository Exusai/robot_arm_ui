import 'package:flutter_number_picker/flutter_number_picker.dart';
import 'package:flutter/material.dart';

class NumberPicker extends StatefulWidget {
  const NumberPicker({Key? key}) : super(key: key);

  @override
  State<NumberPicker> createState() => _NumberPickerState();
}

class _NumberPickerState extends State<NumberPicker> {
  @override
  Widget build(BuildContext context) {
    return CustomNumberPicker(
      initialValue: 1,
      maxValue: 30,
      minValue: 1,
      step: 1,
      onValue: (value) {
        print(value.toString());
      },
    );
  }
}