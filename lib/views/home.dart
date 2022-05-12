import 'package:flutter/material.dart';
import 'package:robot_arm_ui/views/centerColumn/center_column.dart';
import 'package:robot_arm_ui/views/rightColumn/right_column.dart';
import 'leftColumn/left_column.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Robot Control'),
        shadowColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Row(
        children: <Widget>[
          const Expanded(
            flex: 1,
            child: LeftColumn(),
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
                            Text('N Cajas', style: Theme.of(context).textTheme.headline4),
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
                            Text('N Cajas', style: Theme.of(context).textTheme.headline4),
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
