import 'dart:ffi';

import 'package:nepali_date_picker/nepali_date_picker.dart' as picker;
import 'package:flutter/material.dart';

var providence = [
  'Province-1',
  'Province-2',
  'Province-3',
  'Gandaki',
  'Province-5',
  'karnali',
  'Sudurpashchim',
];
var vehicle = [
  'bike/scooter',
  'Car, Jeep, Van, And MicroBus',
];
var displacement = [
  '150',
  '200',
];
var result = "";
int expDate = 0;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bluebook',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Vehicle Tax Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  String providenceValue = providence[0];
  String vehicleValue = vehicle[0];
  String displacementValue = displacement[0];
  Color defColor = Colors.green;
  var dateCOntroller = TextEditingController();

  // List of items in our dropdown menu
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField(
                  icon: Icon(
                    Icons.place,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // fillColor: Colors.blue,
                  ),
                  // dropdownColor: Colors.blue,
                  value: providenceValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      providenceValue = newValue!;
                    });
                  },
                  items:
                      providence.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField(
                  icon: Icon(
                    Icons.car_repair_outlined,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // fillColor: Colors.blue,
                  ),
                  // dropdownColor: Colors.blue,
                  value: vehicleValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      vehicleValue = newValue!;
                    });
                  },
                  items: vehicle.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // fillColor: Colors.blue,
                  ),
                  // dropdownColor: Colors.blue,
                  value: displacementValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      displacementValue = newValue!;
                    });
                  },
                  items: displacement
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 15,
                ),
                OutlinedButton(
                  onPressed: () async {
                    DateTime? date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2030),
                    );
                    dateCOntroller.text = date.toString();
                    if (date != null) {
                      expDate = date.difference(DateTime.now()).inDays;
                      // result = "Total Cost:$expDate";
                    }
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      0.0,
                      18,
                      0.0,
                      18,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Expiry Date",
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.7),
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.date_range_outlined,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 239, 239, 239),
                    side: BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (expDate > 90) {
                      double total = 10000;
                      result = "Total Cost:$total";
                      defColor = Colors.red;
                    } else if (expDate > 0 && expDate < 90) {
                      double total = 1000;
                      result = "Total Cost:$total";
                      defColor = Colors.green;
                    } else {
                      double total = 100;
                      result = "Total Cost:$total";
                      defColor = Colors.grey;
                    }
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Calculate",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Text(
                    result,
                    style: TextStyle(color: defColor, fontSize: 25),
                  ),
                ),
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
