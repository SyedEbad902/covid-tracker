import 'dart:convert';

import 'package:covid_19_app/screens/symptoms.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:http/http.dart' as http;

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData(dropdownvalue);
  }

  Map responseBody = {};
  String dropdownvalue = 'Pakistan';
  var items = [
    'Pakistan',
    'India',
    'Afghanistan',
    'Iran',
    'Iraq',
    "Algeria",
    "Argentina",
    "Australia",
    "Bahrain",
    "Bangladesh",
    "USA",
    "Russia",
  ];

  getData(String newIndex) async {
    var url = Uri.parse('https://disease.sh/v3/covid-19/countries/$newIndex');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        responseBody = jsonDecode(response.body);
        // isloading = false;
      });
    } else {
      throw Exception("failed to load date");
    }
  }

  int currentIndex = 0;
  // String newIndex = "Pakistan";

  @override
  Widget build(BuildContext context) {
    var confirmed = responseBody["cases"];
    var active = responseBody["active"].toString();
    var recovered = responseBody["recovered"].toString();
    var deaths = responseBody["deaths"].toString();
    var tests = responseBody["tests"].toString();
    var critical = responseBody["critical"].toString();
    return responseBody.isEmpty
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                  // color: Color.fromRGBO(207, 227, 252, 5),
                  ),
            ),
          )
        : Scaffold(
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
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                    ),
                    DropdownButton(
                      alignment: AlignmentDirectional.bottomCenter,
                      value: dropdownvalue,
                      borderRadius: BorderRadius.circular(20),
                      padding: const EdgeInsets.all(5),
                      menuMaxHeight: 400,
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                      dropdownColor: const Color.fromRGBO(207, 227, 252, 5),
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

                        getData(dropdownvalue);
                      },
                    ),
                  ],
                ),
              ),
              leadingWidth: double.infinity,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 10,
                        ),
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
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
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
                      initialLabelIndex: currentIndex,
                      totalSwitches: 2,
                      labels: const ['Tracker', 'Symptoms'],
                      radiusStyle: true,
                      onToggle: (index) {
                        setState(() {
                          currentIndex = 0; // Update index state
                        });
                        if (index == 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Symptomss()));
                        }
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, left: 5),
                        child: Container(
                          width: 160,
                          height: 131,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromRGBO(255, 231, 236, 5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 15, top: 15),
                                child: const Text(
                                  "Confirmed ",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(252, 20, 65, 5)),
                                ),
                              ),
                              Container(
                                  margin:
                                      const EdgeInsets.only(top: 40, left: 20),
                                  child: Text(
                                    confirmed.toString(),
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(252, 20, 65, 5)),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, right: 5),
                        child: Container(
                          width: 160,
                          height: 131,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromRGBO(207, 227, 252, 5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 15, top: 15),
                                child: const Text(
                                  "Active",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(74, 156, 252, 5)),
                                ),
                              ),
                              Container(
                                  margin:
                                      const EdgeInsets.only(top: 40, left: 20),
                                  child: Text(
                                    active,
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(74, 156, 252, 5)),
                                  )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, left: 5),
                        child: Container(
                          width: 160,
                          height: 131,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromRGBO(234, 246, 237, 5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 15, top: 15),
                                child: const Text(
                                  "Recovered",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(71, 176, 94, 5)),
                                ),
                              ),
                              Container(
                                  margin:
                                      const EdgeInsets.only(top: 40, left: 20),
                                  child: Text(
                                    recovered,
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(71, 176, 94, 5)),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, right: 5),
                        child: Container(
                          width: 160,
                          height: 131,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromRGBO(240, 241, 242, 5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 15, top: 15),
                                child: const Text(
                                  "Deaths",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(117, 125, 132, 5)),
                                ),
                              ),
                              Container(
                                  margin:
                                      const EdgeInsets.only(top: 40, left: 20),
                                  child: Text(
                                    deaths,
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        color:
                                            Color.fromRGBO(117, 125, 132, 5)),
                                  )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 5, bottom: 10),
                        child: Container(
                          width: 160,
                          height: 131,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromRGBO(248, 242, 201, 5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 15, top: 15),
                                child: const Text(
                                  "Tests",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(199, 176, 26, 5)),
                                ),
                              ),
                              Container(
                                  margin:
                                      const EdgeInsets.only(top: 40, left: 20),
                                  child: Text(
                                    tests,
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(199, 176, 26, 5)),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15, right: 5, bottom: 10),
                        child: Container(
                          width: 160,
                          height: 131,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromRGBO(225, 209, 240, 5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 15, top: 15),
                                child: const Text(
                                  "Critical",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(93, 45, 139, 5)),
                                ),
                              ),
                              Container(
                                  margin:
                                      const EdgeInsets.only(top: 40, left: 20),
                                  child: Text(
                                    critical,
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(93, 45, 139, 5)),
                                  )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
