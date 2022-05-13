import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../controllers/robot.dart';

class StartButton extends StatefulWidget {
  const StartButton({Key? key}) : super(key: key);

  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    final Robot robot = context.watch<Robot?>()!;

    return RoundedLoadingButton(
      elevation: 0.0,
      color: Theme.of(context).colorScheme.primary,
      //color: Theme.of(context).colorScheme.secondary,
      child: const Text('Iniciar', style: TextStyle(color: Colors.white)),
      controller: _btnController,
      onPressed: () async {
        robot.switchInputDisabled();
        bool success = await robot.startPicking();

        // if success
        if (success){
          _btnController.success();
          _btnController.reset();
          robot.addBoxesToPallet(robot.boxesTotake);
          robot.switchInputDisabled();
          robot.resetBoxesTotake();
        } else {
          robot.addLog('ERROR');
          _btnController.error();
          Timer(const Duration(seconds: 3), () {});
          _btnController.reset();
          robot.switchInputDisabled();
          robot.resetBoxesTotake();
        }
      },
    );
  }
}