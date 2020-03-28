import 'package:flutter/material.dart';

// select device to use
// set up a new device

class Dev {
  final String name;
  final String date;

  Dev(this.name, this.date);
}

final Dev front = Dev("Front Yard", "12/03/2016");
final Dev back = Dev("Back Yard", "12/05/2016");

final List<Dev> devs = <Dev>[front, back];

class SelectDevice extends StatefulWidget {
  @override
  _SelectDeviceState createState() => _SelectDeviceState();
}

class _SelectDeviceState extends State<SelectDevice> {

  Dev dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Dev>(
      hint: Text("Select Device"),
      value: dropdownValue,
      items: devs.map((Dev device){
        return DropdownMenuItem<Dev>(
          value: device,
          child: Text(device.name));
      }).toList(), 
      onChanged: (Dev value) {
        setState(() {
          dropdownValue = value;
        });
      },

      
    );
  }
}


class Devices extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SelectDevice(),
    );
  }
}
