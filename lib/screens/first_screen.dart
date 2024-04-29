import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String dropdownvalue = 'Pakistan';
  var items = [
    'Pakistan',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid-19 Tracker"),
        toolbarHeight: 70,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Covid_19 Tracker",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
              ),
              DropdownButton(
                // Initial Value
                value: dropdownvalue,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            ],
          ),
        ),
        leadingWidth: double.infinity,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Container(
                    height: 170,
                    width: 320,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(207, 227, 252, 5),
                    ),
                  ),
                ),
                Positioned(
                    left: 25,
                    top: 20,
                    child: Image.asset('assets/images/doctor.png')),
                Positioned(
                  top: 50,
                  left: 190,
                  child: Text(
                    "Know safety tips and\nprecautions from\ntop doctors",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(6),
              height: 50,
              width: 290,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(251, 216, 197, 5),
                  borderRadius: BorderRadius.circular(15)),
              child: ToggleSwitch(
                minWidth: 140.0,
                cornerRadius: 20.0,
                activeBgColors: [
                  [Colors.white!],
                  [Colors.white!]
                ],
                activeFgColor: Colors.black,
                inactiveBgColor: Color.fromRGBO(251, 216, 197, 5),
                inactiveFgColor: Color.fromRGBO(200, 129, 90, 5),
                initialLabelIndex: 0,
                totalSwitches: 2,
                labels: ['Tracker', 'Symptoms'],
                radiusStyle: true,
                onToggle: (index) {
                  print('switched to: $index');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
