// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/robot.dart';
import 'drop_down_pannel.dart';
import 'number_picker.dart';
import 'radial_button.dart';

class LeftColumn extends StatefulWidget {
  const LeftColumn({Key? key, required this.robot}) : super(key: key);
  final Robot robot;

  @override
  State<LeftColumn> createState() => _LeftColumnState();
}

class _LeftColumnState extends State<LeftColumn> {
  @override
  Widget build(BuildContext context) {
    //final Robot robot = context.watch<Robot?>()!;
    return AbsorbPointer(
      absorbing: widget.robot.inputDisabled,
      child: Container(
        color: Color.fromRGBO(38,39,48,1.0),
        foregroundDecoration: widget.robot.inputDisabled ? BoxDecoration(color: Colors.black38) : null,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text('Opciones para tomar cajas', style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.w300)),
                //SizedBox(height: 20,),
                //Divider(),
                SizedBox(height: 20,),
                Text('Estrategia para tomar cajas (ventosas a usar para tomar caja)', style: Theme.of(context).textTheme.bodyMedium),
                RadialMenu(),
                SizedBox(height: 20,),
                Text('Tipo de cajas a tomar del pallet objetivo', style: Theme.of(context).textTheme.bodyMedium),
                SizedBox(height: 10,),
                DropDown(),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Text('Número de cajas a recoger', style: Theme.of(context).textTheme.bodyMedium),
                    Spacer(),
                    NumberPicker(),
                  ],
                ),
                SizedBox(height: 20,),
                Text('Distribución estimada de cajas:', style: Theme.of(context).textTheme.bodyMedium),
                SizedBox(height: 10,),
                Image.network(
                  widget.robot.palletDistributionImg,
                  height: 385,
                  width: 512,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / 512*512*8
                          : null,
                      ),
                    );
                  },
                  errorBuilder: (context, exception, stackTrace) {
                    return Text('No hay conexión con el robot');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}