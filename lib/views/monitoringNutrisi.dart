import 'package:ali/views/monitoringPage.dart';
import 'package:ali/views/service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class MonitoringNutrisi extends StatefulWidget {
  const MonitoringNutrisi({Key? key}) : super(key: key);

  @override
  State<MonitoringNutrisi> createState() => _MonitoringNutrisiState();
}

class _MonitoringNutrisiState extends State<MonitoringNutrisi> {
  Color warna = const Color.fromRGBO(46, 204, 113, 1);
  String? tinggi_air;
  double presentase = 0.8;
  int? status_penyiraman;
  int? totalSiram;
  String? dateFormat;
  double? value;

  getTime() {
    var time = DateTime.now();
    dateFormat = DateFormat('EEEE, d MMM, yyyy').format(time);
    print(dateFormat);
  }

  getDataSiram() async {
    var data = await Services.getDataSiram();
    totalSiram = int.parse(data['totalSiram']);
    if (totalSiram == 0) {
      value = 0;
    }
    if (totalSiram == 1) {
      value = 0.5;
    }
    if (totalSiram! >= 2) {
      value = 1;
    }
    print(totalSiram);
    setState(() {});
  }

  getStatusPenyiraman() async {
    var data = await Services.getStatusPenyiraman();
    status_penyiraman = int.parse(data['kondisi']);
    print(status_penyiraman);
    setState(() {});
  }

  getDataAir() async {
    var response = await Services.getDataAir();
    tinggi_air = response['tinggi_air'];
    presentase = double.parse(response['persentase']);
    print(tinggi_air);
    print(presentase);
    loading = false;
    setState(() {});
  }

  bool loading = true;

  @override
  void initState() {
    getTime();
    getDataSiram();
    getDataAir();
    getStatusPenyiraman();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: (loading == true)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
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
                                margin: const EdgeInsets.only(right: 10),
                                width: MediaQuery.of(context).size.width * 0.06,
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                                decoration: BoxDecoration(
                                    color: warna,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              const Text(
                                'Connected',
                                style: TextStyle(fontSize: 17),
                              )
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  'Monitoring Nutrisi',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  dateFormat!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10),
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
                          color: const Color.fromRGBO(237, 245, 241, 1),
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
                              const Text('Status Penyiraman'),
                              Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: (status_penyiraman == 0)
                                          ? Colors.red
                                          : warna,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: const Center(
                                      child: FaIcon(
                                    FontAwesomeIcons.faucet,
                                    color: Colors.white,
                                    size: 50,
                                  ))),
                              Text((status_penyiraman == 0)
                                  ? 'Tidak Meyiram'
                                  : 'Menyiram'),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 25, bottom: 10),
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
                          color: const Color.fromRGBO(237, 245, 241, 1),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text('Waktu'),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                child: Column(
                                  children: const [
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
                                  value: value,
                                  valueColor:
                                      AlwaysStoppedAnimation<Color>(warna),
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
                                      child: Text('$totalSiram/2',
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
                    const Padding(
                      padding: EdgeInsets.only(top: 25, bottom: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Ketinggian Nutrisi',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.35,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(237, 245, 241, 1),
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
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: CircularProgressIndicator(
                                        value: presentase,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                warna),
                                        strokeWidth: 13,
                                      ),
                                    ),
                                  ),
                                  Center(
                                      child: Padding(
                                    padding: EdgeInsets.only(top: 80),
                                    child: Text('${tinggi_air!} cm',
                                        style: const TextStyle(fontSize: 38)),
                                  ))
                                ]),
                                const Text(
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
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return MonitoringAir();
                                }));
                              },
                              child: Center(
                                child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Center(
                                        child: FaIcon(
                                      FontAwesomeIcons.droplet,
                                      size: 35,
                                      color: warna,
                                    ))),
                              ),
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
