import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String dropdownValue = '01';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: dropdownValue,
      items: const [
        DropdownMenuItem(child: Text('Caja Surtido Ricolino'), value: '01'),
        DropdownMenuItem(child: Text('Caja Botellas'), value: '02', enabled:false,),
        DropdownMenuItem(child: Text('Caja Café'), value: '03', enabled: false,),
      ],
      isExpanded: true,
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
          print(dropdownValue);
        });
      },
    );
  }
}