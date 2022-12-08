// import 'dart:html';

import 'package:ajua_namaz_1/constants/colors.dart';
import 'package:ajua_namaz_1/constants/textStyles.dart';
import 'package:ajua_namaz_1/screens/fanjr/homeFanjr.dart';
import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors
bool turn = true;

class AlertVremyaNamaz extends StatefulWidget {
  const AlertVremyaNamaz({
    super.key,
  });

  @override
  State<AlertVremyaNamaz> createState() => _AlertVremyaNamazState();
}

class _AlertVremyaNamazState extends State<AlertVremyaNamaz> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide.none,
      ),
      insetPadding: const EdgeInsets.all(24),
      titlePadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      title: Container(
        width: MediaQuery.of(context).size.width - 40,
        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topBody(context),
            SizedBox(height: 24),
            photo_time(),
            alarmBody(),
            buttonBody(),
          ],
        ),
      ),
    );
  }

  Widget buttonBody() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeFanjr(),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: blue,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          'Начать намаз',
          style: tswh_16_600_0,
        ),
      ),
    );
  }

  Container alarmBody() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Будильник',
            style: ts11_16_600_06,
          ),
          Switch(
            value: turn,
            onChanged: (val) {
              print('turned to $val');
              setState(() {
                turn = !turn;
              });
            },
            activeColor: Colors.white,
            activeTrackColor: Colors.black,
            inactiveTrackColor: Colors.black12,
            inactiveThumbColor: Colors.white,
          )
        ],
      ),
    );
  }

  Column photo_time() {
    return Column(
      children: [
        Image(
          image: AssetImage('assets/images/alert_vremya_icon.png'),
          fit: BoxFit.contain,
        ),
        SizedBox(height: 24),
        Text(
          'Фаджр',
          style: ts11_24_600_0,
        ),
        SizedBox(height: 24),
        Text(
          '06:08',
          style: tsbl_48_600_0,
        ),
      ],
    );
  }

  Row topBody(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Время намаза',
          style: ts11_20_600_08,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: greyc1,
            ),
            child: Icon(
              Icons.close,
              color: white,
            ),
          ),
        )
      ],
    );
  }
}
