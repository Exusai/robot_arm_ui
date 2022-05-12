import 'package:flutter/material.dart';
import 'drop_down_pannel.dart';

class LeftRow extends StatelessWidget {
  const LeftRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        Expanded(
          child: DropDown(),
        ),
      ],
    );
  }
}