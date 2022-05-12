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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary, style: BorderStyle.solid, width: 0.80),
        ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: dropdownValue,
          iconEnabledColor: Theme.of(context).colorScheme.secondary,
          isDense: true,
          items: const [
            DropdownMenuItem(child: Text('Caja Surtido Ricolino'), value: '01'),
            DropdownMenuItem(child: Text('Caja Botellas'), value: '02', enabled:true,),
            DropdownMenuItem(child: Text('Caja Café'), value: '03', enabled: true,),
          ],
          isExpanded: true,
          onChanged: (String? value) {
            setState(() {
              dropdownValue = value!;
              print(dropdownValue);
            });
          },
        ),
      ),
    );
  }
}