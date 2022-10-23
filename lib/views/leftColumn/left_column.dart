// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';
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
  // tex editing controllers
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Robot robot = context.watch<Robot?>()!;
    String newURL = '';
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
                ExpansionTile(
                  title: Text("Ajustes de conexión", style: TextStyle(fontWeight: FontWeight.normal),),
                  tilePadding: EdgeInsets.all(0),
                  initiallyExpanded: false,
                  children: [
                    TextField(
                      controller: controller,
                      enabled: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: robot.robotServer,
                      ),
                      onChanged: (text){
                        newURL = text;
                      },
                    ),
                    SizedBox(height: 10,),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: (() {
                          setState(() {
                            if (controller.text.isEmpty){
                              newURL = 'http://localhost';
                              robot.changeRobotServer(newURL);
                            } else {
                              robot.changeRobotServer(controller.text);
                            }
                          });
                        }), 
                        child: Text("Conectarse")
                      ),
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
                SizedBox(height: 10,),
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
                CachedNetworkImage(
                  imageUrl: widget.robot.palletDistributionImg,
                  placeholder: (context, url) {
                    return Container(
                      color: Colors.black,
                      height: 385,
                      width: 512,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                  errorWidget: (context, url, error) {
                    return Container(
                      color: Colors.black,
                      height: 385,
                      width: 512,
                      child: Center(child: Text('No hay conexión con el robot')),
                    );
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