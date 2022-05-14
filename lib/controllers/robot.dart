import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:collection';

class Robot with ChangeNotifier{
  // atributes
  int _boxesToTake;
  int _boxesInPallet;
  bool _horizontalSucker;
  bool _inputDisabled = false;
  final Queue _logs = Queue<String>();
  String robotServer = 'http://0.0.0.0';

  String palletDistributionImg = 'http://0.0.0.0:5000/getPalletDist';

  // getters
  int get boxesTotake => _boxesToTake;
  int get boxesInPallet => _boxesInPallet;
  bool get horizontalSucker => _horizontalSucker;
  bool get inputDisabled => _inputDisabled;
  String get logs {
    String logsAsStr = '';
    for (var element in _logs) {
      logsAsStr += element + '\n';
    }

    return logsAsStr;
  }

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
    _boxesInPallet += boxes;
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

  void addLog(String newLog){
    if (_logs.length >= 10){
      _logs.removeFirst();
    }
    _logs.addLast(newLog);
    notifyListeners();
  }

  void changeRobotServer(String newServer){
    robotServer = newServer;
    notifyListeners();
  }

  Future<void> changeBoxType(String newBoxType) async {
    // pass new box type to server and wait for updated URL
    print(newBoxType);
    
    // simulates awaiting for new requested box type
    Timer(const Duration(seconds: 1), () {});

    // new url with new ident or something
    palletDistributionImg = robotServer + ':5000/getPalletDist';

    notifyListeners();
  } 

  Future<bool> startPicking() async {
    var dio = Dio();
    
    Response response = await dio.post(robotServer + ':5000/goToOffloadPoint');
    addLog(response.data.toString());

    //Timer(const Duration(seconds: 5), () {});

    Response response2 = await dio.post(robotServer + ':5000/estimatePosition');
    addLog(response2.data.toString());
    
    //Timer(const Duration(seconds: 1), () {});

    //Response response3 = await dio.post(robotServer + '/take&n=${_boxesToTake.toString()}&horizontal=${_horizontalSucker.toString()}');
    //Response response3 = await dio.post(robotServer + '/take', data: {'n': _boxesToTake, 'horizontal': _horizontalSucker});
    Response response3 = await dio.post(robotServer + ':5000/take', queryParameters: {'n': _boxesToTake.toString(), 'horizontal': _horizontalSucker.toString()});
    addLog(response3.data.toString());

    bool finished = true;
    if (response3.data.toString() != "error"){
      finished = true;
    } else {
      finished = false;
    }

    return finished;
  } 
}