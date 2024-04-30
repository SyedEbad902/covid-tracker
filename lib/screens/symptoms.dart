import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Symptomss extends StatefulWidget {
  const Symptomss({super.key});

  @override
  State<Symptomss> createState() => _SymptomssState();
}

class _SymptomssState extends State<Symptomss> {
  String dropdownvalue = 'Pakistan';

  var items = [
    'Pakistan',
    'India',
    'Afghanistan',
    'Iran',
    'Iraq',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Covid-19 Tracker"),
          toolbarHeight: 70,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Covid_19 Tracker",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                ),
                DropdownButton(
                  value: dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
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
        body: Column(
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
                      color: const Color.fromRGBO(207, 227, 252, 5),
                    ),
                  ),
                ),
                Positioned(
                    left: 25,
                    top: 20,
                    child: Image.asset('assets/images/doctor.png')),
                const Positioned(
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
              margin: const EdgeInsets.only(top: 20, left: 20),
              padding: const EdgeInsets.all(6),
              height: 50,
              width: 290,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(251, 216, 197, 5),
                  borderRadius: BorderRadius.circular(15)),
              child: ToggleSwitch(
                minWidth: 140.0,
                cornerRadius: 20.0,
                activeBgColors: [
                  [Colors.white!],
                  [Colors.white!]
                ],
                activeFgColor: Colors.black,
                inactiveBgColor: const Color.fromRGBO(251, 216, 197, 5),
                inactiveFgColor: const Color.fromRGBO(200, 129, 90, 5),
                initialLabelIndex: 1,
                totalSwitches: 2,
                labels: const ['Tracker', 'Symptoms'],
                radiusStyle: true,
                onToggle: (index) {
                  if (index == 0) {
                    Navigator.pop(context);
                  }
                },
              ),
            ),
          ],
        ));
  }
}
