// ignore_for_file: prefer_const_constructors

import 'package:ajua_namaz_1/constants/colors.dart';
import 'package:flutter/material.dart';
import 'qiblah_compass.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';

class HomeCompassPage extends StatefulWidget {
  @override
  _HomeCompassPageState createState() => _HomeCompassPageState();
}

class _HomeCompassPageState extends State<HomeCompassPage> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
  final _deviceSupportIos = FlutterQiblah.checkLocationStatus();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent.withOpacity(0),
      //   leading: InkWell(
      //     onTap: () => Navigator.of(context).pop(),
      //     child: Icon(
      //       Icons.chevron_left,
      //       size: 24,
      //       color: black11,
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: FutureBuilder(
          future: _deviceSupport,
          builder: (_, AsyncSnapshot<bool?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error.toString()}"),
              );
            }
            if (snapshot.data!) {
              return QiblahCompass(pushBaackContext: context);
            } else {
              return const Center(
                child: Text("Your device is not supported"),
              );
            }
          },
        ),
      ),
    );
  }
}
