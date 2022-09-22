import 'dart:ui';

import 'package:ali/views/monitoringPage.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Color warna = Color.fromRGBO(46, 204, 113, 1);

  _navigate() async {
    await Future.delayed(const Duration(seconds: 300), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return MonitoringAir();
      }));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 1,
          // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Kampung Melon Napote',
                      style: TextStyle(
                          color: warna,
                          fontWeight: FontWeight.w700,
                          fontSize: 30),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: const Text(
                        'Sistem Monitoring dan Penyiraman Otomatis Tanaman Melon',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
                // decoration:
                //     BoxDecoration(border: Border.all(color: Colors.black)),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                // decoration:
                //     BoxDecoration(border: Border.all(color: Colors.black)),
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 80),
                      child: Image.asset(
                        'assets/siram.png',
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.25,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: MediaQuery.of(context).size.height * 0.1,
                // decoration:
                //     BoxDecoration(border: Border.all(color: Colors.black)),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/logo1.png',
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.6,
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                // decoration:
                //     BoxDecoration(border: Border.all(color: Colors.red)),
                child: Center(
                    child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 63,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/unira.png',
                            width: MediaQuery.of(context).size.width * 0.1,
                            height: MediaQuery.of(context).size.height * 0.1,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                              'Universitas Madura',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      left: 143,
                      child: Text(
                        '<PRO.JS/>',
                        style: TextStyle(
                            color: warna,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                    )
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
