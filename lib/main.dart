import 'package:flutter/material.dart';
import 'package:robot_arm_ui/controllers/robot.dart';
import 'views/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Robot Manipulador de Cajas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        scaffoldBackgroundColor: const Color.fromRGBO(14,17,23,1.0),
        fontFamily: 'Roboto',
        //textTheme: TextTheme(),
      ),
      home: ChangeNotifierProvider(
        create: (context) => Robot(1, 0, true),
        child: const MyHomePage(),
      ),

      //home: MyHomePage(),
    );
  }
}