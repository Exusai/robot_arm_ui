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

    double width = MediaQuery.of(context).size.width;
    bool horizontal = true;
    if (width < 860) { horizontal = false; }

    var children4 = [
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Cajas a recoger de la tarima', style: Theme.of(context).textTheme.bodySmall),
                    Text('${robot.boxesTotake} Cajas', style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.w300)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Cajas en la tarima del Order picker', style: Theme.of(context).textTheme.bodySmall),
                    Text('${robot.boxesInPallet} Cajas', style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.w300)),
                  ],
                ),
              ),
            ],
          ),
          const CenterColumn(),
          const RightColumn(),
        ],
      ),
    ];

    var children3 = [
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
    ];
    
    var children2 = <Widget>[
      horizontal ? Expanded(
        flex: 1,
        child: LeftColumn(robot: robot,),
      ) : LeftColumn(robot: robot,),
      horizontal ? Expanded(
        flex: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children3,
        ),
      ) : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: horizontal ? children3 : children4,
        ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Robot Arm Control', style: horizontal ?  Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.w300) : Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.w300)),
        shadowColor: Colors.transparent,
        centerTitle: true,
      ),
      body: horizontal ? Row(
        children: children2
      ): SingleChildScrollView(child: Column(children: children2,)),
    );
  }
  
}
