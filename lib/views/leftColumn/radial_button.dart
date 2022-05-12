import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';

class RadialMenu extends StatefulWidget {
  const RadialMenu({Key? key}) : super(key: key);

  @override
  State<RadialMenu> createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu> {
  final List<String> _status = ["Horizontal", "Vertical"];
  String radialValue = 'Horizontal';

  @override
  Widget build(BuildContext context) {
    return RadioGroup<String>.builder(
      groupValue: radialValue,
      onChanged: (String? value) => setState(() {
        radialValue = value!;
        print(radialValue);
      }),
      items: _status,
      itemBuilder: (item) => RadioButtonBuilder(
        item,
      ),
    );
  }
}