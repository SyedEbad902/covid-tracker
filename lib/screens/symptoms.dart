import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Symptomss extends StatefulWidget {
  const Symptomss({super.key});

  @override
  State<Symptomss> createState() => _SymptomssState();
}

class _SymptomssState extends State<Symptomss> {
  // String dropdownvalue = 'Pakistan';

  // var items = [
  //   'Pakistan',
  //   'India',
  //   'Afghanistan',
  //   'Iran',
  //   'Iraq',
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Covid-19 Tracker"),
          toolbarHeight: 70,
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Covid_19 Tracker",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                ),
                // DropdownButton(
                //   value: dropdownvalue,
                //   icon: const Icon(Icons.keyboard_arrow_down),
                //   items: items.map((String items) {
                //     return DropdownMenuItem(
                //       value: items,
                //       child: Text(items),
                //     );
                //   }).toList(),
                //   onChanged: (String? newValue) {
                //     setState(() {
                //       dropdownvalue = newValue!;
                //     });
                //   },
                // ),
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
                      margin: const EdgeInsets.only(right: 20),
                      height: 170,
                      width: 320,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromRGBO(207, 227, 252, 5),
                          border: Border.all(
                              color: const Color.fromRGBO(74, 156, 252, 5))),
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
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 20,
                ),
                padding: const EdgeInsets.all(6),
                height: 50,
                width: 290,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(251, 216, 197, 5),
                    borderRadius: BorderRadius.circular(15)),
                child: ToggleSwitch(
                  minWidth: 140.0,
                  cornerRadius: 20.0,
                  activeBgColors: const [
                    [Colors.white],
                    [Colors.white]
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
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 70,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color.fromRGBO(252, 20, 65, 5)),
                  color: const Color.fromRGBO(255, 231, 236, 5),
                ),
                child: Center(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color.fromRGBO(255, 231, 236, 5),
                      radius: 60,
                      child: Image.asset("assets/images/image2.png"),
                    ),
                    title: const Text(
                      "Fever",
                      style: TextStyle(color: Color.fromRGBO(252, 20, 65, 5)),
                    ),
                  ),
                ),
              ),
              Container(
                height: 70,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color.fromRGBO(74, 156, 252, 5),
                  ),
                  color: const Color.fromRGBO(207, 227, 252, 5),
                ),
                child: Center(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color.fromRGBO(207, 227, 252, 5),
                      radius: 60,
                      child: Image.asset(
                        "assets/images/image4.png",
                        height: 120,
                        width: 120,
                      ),
                    ),
                    title: const Text(
                      "Cough",
                      style: TextStyle(color: Color.fromRGBO(74, 156, 252, 5)),
                    ),
                  ),
                ),
              ),
              Container(
                height: 70,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color.fromRGBO(71, 176, 94, 5),
                  ),
                  color: const Color.fromRGBO(234, 246, 237, 5),
                ),
                child: Center(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color.fromRGBO(234, 246, 237, 5),
                      radius: 60,
                      child: Image.asset(
                        "assets/images/image5.png",
                        height: 120,
                        width: 120,
                      ),
                    ),
                    title: const Text(
                      "Body Aches",
                      style: TextStyle(color: Color.fromRGBO(71, 176, 94, 5)),
                    ),
                  ),
                ),
              ),
              Container(
                height: 70,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color.fromRGBO(117, 125, 132, 5),
                  ),
                  color: const Color.fromRGBO(240, 241, 242, 5),
                ),
                child: Center(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color.fromRGBO(240, 241, 242, 5),
                      radius: 60,
                      child: Image.asset(
                        "assets/images/image6.png",
                        height: 120,
                        width: 120,
                      ),
                    ),
                    title: const Text(
                      "Fatigue",
                      style: TextStyle(color: Color.fromRGBO(117, 125, 132, 5)),
                    ),
                  ),
                ),
              ),
              Container(
                height: 70,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color.fromRGBO(199, 176, 26, 5),
                  ),
                  color: const Color.fromRGBO(248, 242, 201, 5),
                ),
                child: Center(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color.fromRGBO(248, 242, 201, 5),
                      radius: 60,
                      child: Image.asset(
                        "assets/images/image7.png",
                        height: 120,
                        width: 120,
                      ),
                    ),
                    title: const Text(
                      "Diarrhea",
                      style: TextStyle(color: Color.fromRGBO(199, 176, 26, 5)),
                    ),
                  ),
                ),
              ),
              Container(
                height: 70,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color.fromRGBO(93, 45, 139, 5),
                  ),
                  color: const Color.fromRGBO(225, 209, 240, 5),
                ),
                child: Center(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color.fromRGBO(225, 209, 240, 5),
                      radius: 60,
                      child: Image.asset(
                        "assets/images/image8.png",
                        height: 120,
                        width: 120,
                      ),
                    ),
                    title: const Text(
                      "Vomiting",
                      style: TextStyle(color: Color.fromRGBO(93, 45, 139, 5)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
