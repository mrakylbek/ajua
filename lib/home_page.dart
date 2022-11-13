import 'package:ajua_namaz_1/carousel_clider.dart';
import 'package:flutter/material.dart';

import 'bottomNavBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

TextStyle ts = const TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: Color(0xff333333),
);
// Color green = const Color(0xff00CF91);
Color green = const Color(0xff009DBF);
List vremya = ['Фаджр', 'Восход', 'Зухр', 'Аср', 'Магриб', 'Иша'];
bool turn = true;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            appBar(),
            Container(
              height: 467,
              margin: EdgeInsets.only(bottom: 30, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [firstColumn(maxWidth), secondColumn(maxWidth)],
              ),
            ),
            CarouselBody(tile_body: carousel_tile()),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Container carousel_tile() {
    return Container(
      // height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 138,
            height: 109,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/ramadan.png'),
              fit: BoxFit.contain,
            )),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Рамаданга',
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
                  color: green,
                  fontFamily: 'Open Sans',
                ),
              ),
            ],
          ),
          SizedBox(width: 15)
        ],
      ),
    );
  }

  Stack secondColumn(double maxWidth) {
    return Stack(
      children: [
        Icon(
          Icons.mosque,
          color: Colors.grey[300],
          size: (maxWidth - 40 - 20 - 10) / 2,
        ),
        Container(
          margin: EdgeInsets.only(top: (maxWidth - 140) / 2),
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 0),
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
                  vremya.length, (index) => vremya_tile(index, maxWidth))),
        )
      ],
    );
  }

  Container vremya_tile(int i, double maxWidth) {
    return Container(
      // margin: ,
      width: (maxWidth - 40 - 12) / 2,

      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            vremya[i],
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: i != 0 ? const Color(0xff011627) : green,
            ),
          ),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                i == 0
                    ? 'images/sound_off_green.png'
                    : 'images/sound_off_black.png',
              ),
              fit: BoxFit.contain,
            )),
          ),
        ],
      ),
    );
  }

  Stack firstColumn(double maxWidth) {
    return Stack(
      children: [
        Container(
          // width: (maxWidth - 40 - 20 - 10) / 2,
          // height: 120,
          // color: Colors.grey[400],
          // color: Colors.yellow,
          child: Icon(
            Icons.mosque,
            color: Colors.grey[300],
            size: (maxWidth - 40 - 20 - 10) / 2,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: (maxWidth - 140) / 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              fajr(maxWidth),
              time(maxWidth),
            ],
          ),
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
                  color: green,
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
              SizedBox(height: 20),
              Text(
                'Время до намаза ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffB9B9B9),
                ),
              ),
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
          // Icon(
          //   Icons.mosque,
          //   color: green,
          //   size: 24,
          // ),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/mosque_icon.png'),
              fit: BoxFit.contain,
            )),
          ),
          SizedBox(height: 24),
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
              SizedBox(height: 16),
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
                      color: green,
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

  Row appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Четверг', style: ts),
            Text('21 Апреля, 2022', style: ts),
          ],
        ),
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/Kuran.png'),
            fit: BoxFit.contain,
          )),
        ),
      ],
    );
  }
}
