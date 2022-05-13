import 'dart:async';
import 'package:flutter/material.dart';

class Robot with ChangeNotifier{
  // atributes
  int _boxesToTake;
  int _boxesInPallet;
  bool _horizontalSucker;
  bool _inputDisabled = false;
  String _logs = '';

  // getters
  int get boxesTotake => _boxesToTake;
  int get boxesInPallet => _boxesInPallet;
  bool get horizontalSucker => _horizontalSucker;
  bool get inputDisabled => _inputDisabled;
  String get logs => _logs;

  // optional atributes
  String? palletDistributionImg;

  // Constructor
  Robot(this._boxesToTake, this._boxesInPallet, this._horizontalSucker);

  // mutate vals and notify
  void addBoxesTotake(int boxes){
    _boxesToTake = boxes;
    notifyListeners();
  }

  void resetBoxesTotake(){
    _boxesToTake = 1;
    notifyListeners();
  }

  void addBoxesToPallet(int boxes){
    _boxesInPallet = boxes;
    notifyListeners();
  }

  void switchSuckers(){
    _horizontalSucker = !_horizontalSucker;
    notifyListeners();
  }

  void switchInputDisabled(){
    _inputDisabled = !_inputDisabled;
    notifyListeners();
  }

  // TODO: get status from server

  // TODO: func to get box distribution img
  Future<void> changeBoxType(String newBoxType) async {
    // pass new box type to server and wait for updated URL
    Timer(const Duration(seconds: 1), () {});
    print(newBoxType);
    palletDistributionImg = 'https://dummyimage.com/512x512/fff/aaa';
    notifyListeners();
  } 

  void startPicking() async {}

  
}