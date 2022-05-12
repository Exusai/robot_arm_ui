import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class StartButton extends StatefulWidget {
  const StartButton({Key? key}) : super(key: key);

  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();

  void _doSomething() async {
      Timer(const Duration(seconds: 3), () {
          _btnController.success();
          Timer(const Duration(seconds: 1), () {
            _btnController.reset();
          });
      });
  }

  @override
  Widget build(BuildContext context) {
    return RoundedLoadingButton(
      elevation: 0.0,
      color: Theme.of(context).colorScheme.primary,
      //color: Theme.of(context).colorScheme.secondary,
      child: const Text('Iniciar', style: TextStyle(color: Colors.white)),
      controller: _btnController,
      onPressed: _doSomething,
    );
  }
}