// ignore_for_file: prefer_const_constructors

import 'package:ajua_namaz_1/constants/colors.dart';
import 'package:ajua_namaz_1/constants/textStyles.dart';
import 'package:ajua_namaz_1/screens/fanjr/carouselOfImage.dart';
import 'package:ajua_namaz_1/screens/kuran/home_sura_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeKuran extends StatefulWidget {
  const HomeKuran({super.key});

  @override
  State<HomeKuran> createState() => _HomeKuranState();
}

class _HomeKuranState extends State<HomeKuran> {
  @override
  Widget build(BuildContext context) {
    double maxH = MediaQuery.of(context).size.height;
    double maxW = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar(),
      backgroundColor: whitef4,
      body: fanjrBody(maxH, maxW),
    );
  }

  SafeArea fanjrBody(double maxH, double maxW) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              searchBox(),
              SizedBox(height: 14),
              Column(
                children: List.generate(
                  15,
                  (index) => suraTile(index),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget suraTile(int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => HomeSuraPage()),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        // height: 63,
        margin: EdgeInsets.symmetric(vertical: 6),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 30,
                  decoration: BoxDecoration(
                    color: blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 7),
                  child: Text(
                    (index + 1).toString(),
                    style: tswh_16_600_0,
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Фатиха',
                      style: ts11_14_700_08_el,
                    ),
                    SizedBox(height: 5),
                    Text(
                      '(Открывающая Коран)',
                      style: ts87_14_400_0,
                    ),
                  ],
                )
              ],
            ),
            Icon(
              Icons.chevron_right,
              size: 24,
              color: black11,
            )
          ],
        ),
      ),
    );
  }

  Widget searchBox() {
    return Container(
      height: 52,
      alignment: Alignment.centerRight,
      // decoration: BoxDecoration(
      //   color: white,
      //   borderRadius: BorderRadius.circular(20),
      // ),
      child: TextField(
        onTap: () {
          setState(() {
            // isSearches = true;
          });
        },
        textCapitalization: TextCapitalization.words,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          filled: true,
          // fillColor: Colors.white,
          fillColor: white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 19, horizontal: 20),
          hintText: 'Поиск',
          // hintStyle: const TextStyle(color: Color(0xFFADADAD), fontSize: 16),
          hintStyle: ts87_16_500_0,
          suffixIcon: Container(
            width: 36,
            // color: Colors.yellow,
            // height: 36,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 36,
                  alignment: Alignment.center,
                  // padding: EdgeInsets.all(12),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    // color: const Color(0xFF222222),
                    color: blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    CupertinoIcons.search,
                    color: white,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: white,
      leading: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Icon(
          Icons.chevron_left,
          size: 24,
          color: black11,
        ),
      ),
      title: Text(
        'Куран',
        style: ts11_16_600_06,
      ),
      centerTitle: true,
      elevation: 0,
    );
  }
}
