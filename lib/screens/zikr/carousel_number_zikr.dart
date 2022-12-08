// ignore_for_file: prefer_const_constructors

import '../../constants/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselZikrNumber extends StatefulWidget {
  const CarouselZikrNumber({super.key});
  // final List<Widget> tile_body;
  @override
  State<CarouselZikrNumber> createState() => _CarouselZikrNumberState();
}

bool isAutoPLay = false;

class _CarouselZikrNumberState extends State<CarouselZikrNumber> {
  late PageController _pageController;

  int activePage = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  List<int> numbers = List.generate(51, (index) => (index));

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
              left: (MediaQuery.of(context).size.width - 42) / 2, top: 30),
          height: 150,
          width: 1,
          color: greyc1,
        ),
        CarouselSlider(
          options: CarouselOptions(
              height: 210.0,
              autoPlay: isAutoPLay,
              // autoPlayAnimationDuration: Duration(seconds: 1),
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              disableCenter: true,
              reverse: true,
              viewportFraction: 0.5,
              autoPlayAnimationDuration: Duration(milliseconds: 5200),
              scrollDirection: Axis.vertical,
              onPageChanged: ((index, reason) {
                setState(() {
                  activePage = index;
                });
              })),
          items: List.generate(
            numbers.length,
            (index) => GestureDetector(
              onTap: () {
                // activePage == index
                //     ? {
                //         print('tapped'),
                //         setState(() {
                //           isAutoPLay = true;
                //         }),
                //         activePage++,
                //         setState(() {
                //           isAutoPLay = false;
                //         }),
                //       }
                //     : null;
              },
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      width: activePage == index ? 100 : 70,
                      decoration: BoxDecoration(
                        color:
                            activePage == index ? blue : blue.withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Center(
                        // padding: const EdgeInsets.all(5.0),
                        child: Text(
                          '${numbers[index]}',
                          style: TextStyle(
                            fontSize: activePage == index ? 36 : 18,
                            fontWeight: activePage == index
                                ? FontWeight.w600
                                : FontWeight.w300,
                            color: activePage == index ? white : white,
                            letterSpacing: -2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
