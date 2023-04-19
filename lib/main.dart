import 'package:flutter/material.dart';

var rate;

var providence = [
  {
    "id": 1,
    "name": "Province 1",
  },
  {
    "id": 2,
    "name": "Province 2 (Madhesh)",
  },
  {
    "id": 3,
    "name": "Province 3 (Bagmati)",
  },
  {
    "id": 4,
    "name": "Province 4 (Gandaki)",
  },
  {
    "id": 5,
    "name": "Province 5 (Lumbini)",
  },
  {
    "id": 6,
    "name": "Province 6 (Karnali)",
  },
  {
    "id": 7,
    "name": "Province 7 (Sudurpaschim)",
  }
];
var vehicle = [
  {
    "id": 1,
    "name": 'bike/scooter',
  },
  // {
  //   "id": 2,
  //   "name": 'Car, Jeep, Van, And MicroBus',
  // }
];

var displacement = [];

var loadData = {
  "1": [
    {"id": 5, "cc": "More than 400 CC", "rate": 18000},
    {"id": 4, "cc": "251 CC - 400 CC", "rate": 10000},
    {"id": 3, "cc": "161 CC - 250 CC", "rate": 5500},
    {"id": 2, "cc": "126 CC - 160 CC", "rate": 4000},
    {"id": 1, "cc": "Up to 125 CC", "rate": 3000}
  ],
  "2": [
    {"id": 5, "cc": "More than 400 CC", "rate": 17000},
    {"id": 4, "cc": "251 CC - 400 CC", "rate": 10000},
    {"id": 3, "cc": "161 CC - 250 CC", "rate": 6000},
    {"id": 2, "cc": "126 CC - 160 CC", "rate": 4500},
    {"id": 1, "cc": "Up to 125 CC", "rate": 2700}
  ],
  "3": [
    {"id": 6, "cc": "More than 650 CC", "rate": 30000},
    {"id": 5, "cc": "401 CC - 650 CC ", "rate": 20000},
    {"id": 4, "cc": "226 CC - 400 CC", "rate": 11000},
    {"id": 3, "cc": "161 CC - 225 CC", "rate": 6500},
    {"id": 2, "cc": "126 CC - 160 CC", "rate": 5000},
    {"id": 1, "cc": "Up to 125 CC", "rate": 3000}
  ],
  "4": [
    {"id": 5, "cc": "More than 650 CC", "rate": 30000},
    {"id": 4, "cc": "401 CC - 650 CC", "rate": 20000},
    {"id": 3, "cc": "226 CC - 400 CC", "rate": 11000},
    {"id": 2, "cc": "161 CC - 225 CC", "rate": 6500},
    {"id": 2, "cc": "126 CC - 160 CC", "rate": 5000},
    {"id": 1, "cc": "Up to 125 CC", "rate": 3000}
  ],
  "5": [
    {"id": 5, "cc": "More than 400 CC", "rate": 25000},
    {"id": 4, "cc": "251 CC - 400 CC", "rate": 11000},
    {"id": 3, "cc": "161 CC - 250 CC", "rate": 5500},
    {"id": 2, "cc": "126 CC - 160 CC", "rate": 4500},
    {"id": 1, "cc": "Up to 125 CC", "rate": 2600}
  ],
  "6": [
    {"id": 4, "cc": "More than 400 CC", "rate": 15000},
    {"id": 3, "cc": "251 CC - 400 CC", "rate": 8000},
    {"id": 2, "cc": "126 CC - 250 CC ", "rate": 4000},
    {"id": 1, "cc": "Up to 125 CC", "rate": 2500}
  ],
  "7": [
    {"id": 5, "cc": "More than 400 CC", "rate": 9000},
    {"id": 4, "cc": "251 CC - 400 CC", "rate": 8000},
    {"id": 3, "cc": "151 CC - 250 CC ", "rate": 5500},
    {"id": 2, "cc": "126 CC - 150 CC", "rate": 4500},
    {"id": 1, "cc": "Up to 125 CC", "rate": 2500}
  ]
};
var result = "";
var fine = "";
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
  Future<void> AllCcs() async {
    final response = await loadallCcs(loadData['1']);
    setState(() {
      displacement = response;
    });
  }

  @override
  void initState() {
    this.AllCcs();
    // super.initState();
  }

  var expDateC = TextEditingController();
  String providenceValue = providence.first['id'].toString();
  String vehicleValue = vehicle.first['id'].toString();
  String displacementValue = loadCcs(loadData['1']);
  Color defColor = Colors.green;
  var dateCOntroller = TextEditingController();
  @override
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
                      height: 150,
                      width: 150,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      result,
                      style: TextStyle(color: defColor, fontSize: 20),
                    ),
                    Text(
                      fine,
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ],
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
                  onChanged: (String? newValue) async {
                    providenceValue = newValue!;
                    displacementValue = loadCcs(loadData[providenceValue]);
                    final res = await loadallCcs(loadData[providenceValue]);
                    displacement = res;
                    setState(() {});
                  },
                  items: providence.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value['id'].toString(),
                      child: Text(
                        value['name'].toString(),
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
                      // print(vehicleValue);
                    });
                  },
                  items: vehicle.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value['id'].toString(),
                      child: Text(
                        value['name'].toString(),
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
                      // print(displacementValue);
                      var temp = loadData[providenceValue];
                      if (temp != null) {
                        temp.forEach((e) {
                          if (e["cc"] == displacementValue) {
                            rate = e["rate"];
                          }
                        });
                      }
                    });
                  },
                  items: displacement.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value.toString(),
                      child: Text(
                        value.toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 15,
                ),
                // OutlinedButton(
                //   onPressed: () async {
                //     DateTime? date = await showDatePicker(
                //       context: context,
                //       initialDate: DateTime.now(),
                //       firstDate: DateTime(2023),
                //       lastDate: DateTime(2030),
                //     );
                //     dateCOntroller.text = date.toString();
                //     if (date != null) {
                //       expDate = date.difference(DateTime.now()).inDays;
                //       print(expDate);
                //       // result = "Total Cost:$expDate";
                //     }
                //     setState(() {});
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.fromLTRB(
                //       0.0,
                //       18,
                //       0.0,
                //       18,
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Text(
                //           "Expiry Date",
                //           style: TextStyle(
                //             color: Color.fromRGBO(0, 0, 0, 0.7),
                //             fontSize: 20,
                //             fontWeight: FontWeight.normal,
                //           ),
                //         ),
                //         SizedBox(
                //           width: 10,
                //         ),
                //         Icon(
                //           Icons.date_range_outlined,
                //           color: Colors.black,
                //         ),
                //       ],
                //     ),
                //   ),
                //   style: OutlinedButton.styleFrom(
                //     backgroundColor: Color.fromARGB(255, 239, 239, 239),
                //     side: BorderSide(
                //       width: 1,
                //       color: Colors.grey,
                //     ),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //   ),
                // ),
                TextField(
                  controller: expDateC,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 242, 242, 242),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    label: Text('Expired days'),
                    hintText: "if not expired 0",
                    suffixIcon: Icon(
                      Icons.date_range_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (rate != null && expDateC.text != '') {
                      int expDate = int.parse(expDateC.text.toString());
                      if (expDate > 365) {
                        double total = rate + (rate * 32 / 100);
                        result = "Total Cost:$total";
                        fine = "(with 32% fine)";
                        defColor = Colors.red;
                      } else if (expDate > 76 && expDate <= 365) {
                        double total = rate + (rate * 20 / 100);
                        result = "Total Cost:$total";
                        fine = "(with 20% fine)";
                        defColor = Colors.red;
                      } else if (expDate > 30 && expDate <= 76) {
                        double total = rate + (rate * 10 / 100);
                        result = "Total Cost:$total";
                        fine = "(with 10% fine)";
                        defColor = Colors.red;
                      } else if (expDate <= 30 && expDate > 1) {
                        double total = rate + (rate * 5 / 100);
                        fine = "(with 5% fine)";
                        result = "Total Cost:$total";
                        defColor = Colors.red;
                      } else {
                        double total = rate * 1.0;
                        fine = "(with 0% fine)";
                        result = "Total Cost:$total";
                        defColor = Colors.green;
                      }
                    } else {
                      result = "Please fill all feilds";
                      defColor = Colors.red;
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
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

loadCcs(prov1) {
  if (prov1 != null) {
    return prov1[0]['cc'].toString();
  }
}

loadallCcs(prov1) {
  List abc = [];
  for (var p in prov1) {
    abc.add(p['cc'].toString());
  }
  return abc;
}
