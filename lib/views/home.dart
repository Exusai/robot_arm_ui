import 'package:flutter/material.dart';
import 'package:robot_arm_ui/views/centerColumn/center_column.dart';
import 'package:robot_arm_ui/views/rightColumn/right_column.dart';
import 'package:provider/provider.dart';
import '../controllers/robot.dart';
import 'leftColumn/left_column.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
  
    Robot robot = Provider.of<Robot?>(context, listen: true)!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Robot Arm Control', style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.w300)),
        shadowColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: LeftColumn(robot: robot,),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Cajas a recoger de la tarima', style: Theme.of(context).textTheme.bodyMedium),
                            Text('${robot.boxesTotake} Cajas', style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.w300)),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Cajas en la tarima del Order picker', style: Theme.of(context).textTheme.bodyMedium),
                            Text('${robot.boxesInPallet} Cajas', style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.w300)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Expanded(
                      child: CenterColumn()
                    ),
                    Expanded(
                      child: RightColumn(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ]
      ),
    );
  }
}
