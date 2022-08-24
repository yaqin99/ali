import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MonitoringPage extends StatefulWidget {
  const MonitoringPage({Key? key}) : super(key: key);

  @override
  State<MonitoringPage> createState() => _MonitoringPageState();
}

class _MonitoringPageState extends State<MonitoringPage> {
  Color warna = Color.fromRGBO(46, 204, 113, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 1,
          // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.18,
                // decoration:
                // BoxDecoration(border: Border.all(color: Colors.black)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          width: MediaQuery.of(context).size.width * 0.06,
                          height: MediaQuery.of(context).size.height * 0.03,
                          decoration: BoxDecoration(
                              color: warna,
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        Text(
                          'Connected',
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Monitoring Air',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Senin, 17 Agustus 2022 - 07:00',
                            style: TextStyle(
                                fontWeight: FontWeight.w100, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(237, 245, 241, 1),
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(children: [
                            Center(
                              child: Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100)),
                                child: CircularProgressIndicator(
                                  value: 0.7,
                                  valueColor:
                                      new AlwaysStoppedAnimation<Color>(warna),
                                  strokeWidth: 13,
                                ),
                              ),
                            ),
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.only(top: 80),
                              child: Text('190 cm',
                                  style: TextStyle(fontSize: 38)),
                            ))
                          ]),
                          Text(
                            'Tinggi Air',
                            style: TextStyle(fontSize: 20),
                          )
                        ]),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Penyiraman Otomatis',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(237, 245, 241, 1),
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Waktu'),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.04,
                          child: Column(
                            children: [
                              Text('06:00 - 06:15'),
                              Text('06:00 - 06:15'),
                            ],
                          ),
                        )
                      ],
                    ),
                    Stack(children: [
                      Center(
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100)),
                          child: CircularProgressIndicator(
                            value: 0.5,
                            valueColor:
                                new AlwaysStoppedAnimation<Color>(warna),
                            strokeWidth: 9,
                          ),
                        ),
                      ),
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 60, left: 35),
                        child: Column(
                          children: [
                            Center(
                                child: Text('1/2',
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold))),
                            Center(
                                child: Text('Sehari',
                                    style: TextStyle(fontSize: 16))),
                          ],
                        ),
                      ))
                    ]),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Siram Sekarang',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(237, 245, 241, 1),
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(children: [
                      Center(
                        child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                                child: FaIcon(
                              FontAwesomeIcons.powerOff,
                              size: 75,
                              color: warna,
                            ))),
                      ),
                    ]),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Status Penyiraman'),
                        Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                color: warna,
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                                child: FaIcon(
                              FontAwesomeIcons.faucet,
                              color: Colors.white,
                              size: 50,
                            ))),
                        Text('Menyiram'),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Pemberian Nutrisi',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(237, 245, 241, 1),
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(children: [
                      Center(
                        child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                                child: FaIcon(
                              FontAwesomeIcons.droplet,
                              size: 35,
                              color: warna,
                            ))),
                      ),
                    ]),
                    Center(
                        child: Image.asset(
                      'assets/nutrisi1.png',
                      width: 80,
                      height: 80,
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
