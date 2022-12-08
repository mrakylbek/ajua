// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:ajua_namaz_1/constants/textStyles.dart';
import 'package:ajua_namaz_1/screens/home_page/alert_nachat.dart';
import 'package:ajua_namaz_1/screens/home_page/alert_vremya.dart';
import 'package:ajua_namaz_1/screens/home_page/carousel_clider.dart';

// import '../bottomNavBar.dart';
import '../../constants/colors.dart';

TextStyle ts = const TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: Color(0xff333333),
);
// Color green = const Color(0xff00CF91);
List vremya = ['Фаджр', 'Восход', 'Зухр', 'Аср', 'Магриб', 'Иша'];
bool turn = true;

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // appBar2(),
              Container(
                // height: 467,
                // color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [firstColumn(maxWidth), secondColumn(maxWidth)],
                ),
              ),
              CarouselBody(tile_body: carousel_tile()),
              // Container(
              //   width: 150,
              //   height: 200,
              //   color: Colors.yellow,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Container carousel_tile() {
    return Container(
      // height: 120,
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 5),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 138,
            height: 109,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/ramadan.png'),
              fit: BoxFit.contain,
            )),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Рамаданга',
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontFamily: 'Open Sans',
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '92 кун калды',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: blue,
                    fontFamily: 'Open Sans',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 15)
        ],
      ),
    );
  }

  Widget secondColumn(double maxWidth) {
    return Column(
      children: [
        SizedBox(
          width: (maxWidth - 40 - 25) / 2,
          child: Image(
            image: AssetImage('assets/images/mosque_2.png'),
            fit: BoxFit.contain,
          ),
        ),
        Container(
          // margin: EdgeInsets.only(top: (maxWidth - 140) / 2),
          // margin: EdgeInsets.only(top: (maxWidth - 100) / 2),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 5),
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              vremya.length,
              (index) => vremya_tile(index, maxWidth),
            ),
          ),
        )
      ],
    );
  }

  Widget vremya_tile(int i, double maxWidth) {
    return Container(
      // margin: ,
      width: (maxWidth - 40 - 12) / 2,
      margin: EdgeInsets.symmetric(vertical: 3),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              showGeneralDialog(
                context: context,
                pageBuilder: (((context, animation, secondaryAnimation) =>
                    AlertVremyaNamaz())),
              );
            },
            child: Text(
              vremya[i],
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: i != 0 ? const Color(0xff011627) : blue,
              ),
            ),
          ),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                i == 0
                    ? 'assets/images/sound_off_green.png'
                    : 'assets/images/sound_off_black.png',
              ),
              fit: BoxFit.contain,
            )),
          ),
        ],
      ),
    );
  }

  Widget firstColumn(double maxWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: (maxWidth - 40 - 25) / 2,
          child: Image(
            image: AssetImage('assets/images/mosque_1.png'),
            fit: BoxFit.contain,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            fajr(maxWidth),
            SizedBox(height: 14),
            time(maxWidth),
          ],
        )
      ],
    );
  }

  Widget time(double maxWidth) {
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 5),
          )
        ],
      ),
      width: (maxWidth - 40 - 12) / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.access_time,
                  color: blue,
                  size: 24,
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
          ),
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '02:34',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Время до намаза ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffB9B9B9),
                ),
              ),
              SizedBox(height: 4),
            ],
          )
        ],
      ),
    );
  }

  Widget fajr(double maxWidth) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 5),
          )
        ],
      ),
      width: (maxWidth - 40 - 12) / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 24,
            height: 24,
            margin: EdgeInsets.only(bottom: 12),
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //   image: AssetImage('assets/images/mosque_icon.png'),
            //   fit: BoxFit.contain,
            // )),
            child: Image(
              image: AssetImage('assets/images/mosque_icon.png'),
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Фаджр',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  const Text(
                    'Начало ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffB9B9B9),
                    ),
                  ),
                  Text(
                    '06:08',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: blue,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
