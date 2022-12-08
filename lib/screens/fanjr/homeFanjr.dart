// ignore_for_file: prefer_const_constructors

import 'package:ajua_namaz_1/constants/colors.dart';
import 'package:ajua_namaz_1/constants/textStyles.dart';
import 'package:ajua_namaz_1/screens/fanjr/carouselOfImage.dart';
import 'package:flutter/material.dart';

class HomeFanjr extends StatefulWidget {
  const HomeFanjr({super.key});

  @override
  State<HomeFanjr> createState() => _HomeFanjrState();
}

class _HomeFanjrState extends State<HomeFanjr> {
  @override
  Widget build(BuildContext context) {
    double maxH = MediaQuery.of(context).size.height;
    double maxW = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar(),
      backgroundColor: whitef4,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: floatButton(),
      floatingActionButton: floatButton(),
      body: fanjrBody(maxH, maxW),
    );
  }

  SafeArea fanjrBody(double maxH, double maxW) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        padding: EdgeInsets.all(16),
        height: (maxH - 40 - 50 - 20 - 40),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: double.infinity,
              // height: (maxH - 40 - 60 - 32 - 80),
              height: (maxH - 40 - 32 - 50 - 20 - 40),
              // color: blue,
              child: CarouselOfImage(
                maxHeight: (maxH - 40 - 32 - 50 - 20 - 40 - 16),
                // maxWidth: (maxW - 40 - 32),
                maxWidth: (maxW),
              ), // Carousel slider of images
            ),
            // SizedBox(
            //   height: 80,
            //   width: double.infinity,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         'Аудио всего намаза',
            //         style: ts11_14_400_08,
            //       ),
            //       Container(
            //         width: double.infinity,
            //         height: 50,
            //         decoration: BoxDecoration(
            //           color: greyc1,
            //           borderRadius: BorderRadius.circular(16),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  SafeArea floatButton() {
    return SafeArea(
      child: InkWell(
        onTap: () {
          print('Tapped start Button');
        },
        child: Container(
          width: double.infinity,
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: blue,
            borderRadius: BorderRadius.circular(50),
          ),
          alignment: Alignment.center,
          child: Text(
            'Start',
            style: tsf4_24_500_328,
          ),
        ),
      ),
    );
  }

  // SafeArea floatButton() {
  //   return SafeArea(
  //     child: Container(
  //       width: double.infinity,
  //       margin: EdgeInsets.symmetric(horizontal: 20),
  //       padding: EdgeInsets.symmetric(horizontal: 8),
  //       decoration: BoxDecoration(
  //         color: white,
  //         borderRadius: BorderRadius.circular(50),
  //       ),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Container(
  //             decoration: BoxDecoration(
  //               color: blue,
  //               borderRadius: BorderRadius.circular(20),
  //             ),
  //             padding: EdgeInsets.symmetric(horizontal: 8),
  //             child: Row(
  //               children: [
  //                 CircleAvatar(
  //                   backgroundColor: white,
  //                   radius: 24,
  //                   child: Icon(
  //                     Icons.chevron_left,
  //                     color: blue,
  //                   ),
  //                 ),
  //                 Container(
  //                   margin: EdgeInsets.symmetric(horizontal: 16),
  //                   child: Text(
  //                     '1/7',
  //                     style: tsf4_14_600_01,
  //                   ),
  //                 ),
  //                 CircleAvatar(
  //                   backgroundColor: white,
  //                   radius: 24,
  //                   child: Icon(
  //                     Icons.chevron_left,
  //                     color: blue,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           Icon(
  //             Icons.menu,
  //             color: blue,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

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
        'Фанджр',
        style: ts11_16_600_06,
      ),
      centerTitle: true,
      elevation: 0,
    );
  }
}
