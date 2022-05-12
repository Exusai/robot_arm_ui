import 'dart:async';
import 'package:flutter/material.dart';

class Robot with ChangeNotifier{
  
  int _boxesToTake;
  int _boxesInPallet;
  bool _horizontalSucker;

  bool _inputDisabled = false; 

  int get boxesTotake => _boxesToTake;
  int get boxesInPallet => _boxesInPallet;
  bool get horizontalSucker => _horizontalSucker;
  bool get inputDisabled => _inputDisabled;

  String? palletDistributionImg;
  String? status;

  Robot(this._boxesToTake, this._boxesInPallet, this._horizontalSucker);

  void addBoxesTotake(int boxes){
    _boxesToTake = boxes;
    notifyListeners();
  }

  void resetBoxesTotake(){
    _boxesToTake = 0;
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