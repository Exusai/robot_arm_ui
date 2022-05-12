// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'drop_down_pannel.dart';
import 'number_picker.dart';
import 'radial_button.dart';

class LeftColumn extends StatelessWidget {
  const LeftColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(38,39,48,1.0),
      // TODO: if not vertical
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Text('Opciones para tomar cajas', style: Theme.of(context).textTheme.headline6),
              //SizedBox(height: 20,),
              //Divider(),
              SizedBox(height: 20,),
              Text('Estrategia para tomar cajas (ventosas a usar para tomar caja)', style: Theme.of(context).textTheme.bodyMedium),
              RadialMenu(),
              SizedBox(height: 20,),
              Text('Tipo de cajas a tomar del pallet objetivo', style: Theme.of(context).textTheme.bodyMedium),
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
              Text('Distribución estimada de cajas', style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: 10,),
              Image.network('https://via.placeholder.com/512x512')
      
            ],
          ),
        ),
      ),
    );
  }
}