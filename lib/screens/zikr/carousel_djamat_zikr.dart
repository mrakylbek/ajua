import '../../constants/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselDjamatZikr extends StatefulWidget {
  const CarouselDjamatZikr({super.key, required this.tile_body});
  final List<Widget> tile_body;
  @override
  State<CarouselDjamatZikr> createState() => _CarouselDjamatZikrState();
}

class _CarouselDjamatZikrState extends State<CarouselDjamatZikr> {
  late PageController _pageController;

  int activePage = 0;
  double widthOfChecker = 12;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
    widthOfChecker = ((200 - (widget.tile_body.length * 1)) /
            (widget.tile_body.length + 3)) -
        8;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 165.0,
              autoPlay: true,
              enlargeCenterPage: false,
              viewportFraction: 1,
              onPageChanged: ((index, reason) {
                setState(() {
                  activePage = index;
                });
              })),
          items: List.generate(
            widget.tile_body.length,
            (index) => widget.tile_body[index],
          ),
        ),
        indexChecker(),
      ],
    );
  }

  Widget indexChecker() {
    return Container(
      width: 200,
      margin: EdgeInsets.symmetric(
          horizontal:
              ((MediaQuery.of(context).size.width - 200 - 32 - 40) / 2)),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          widget.tile_body.length,
          (index) => Container(
            width:
                activePage == index ? ((widthOfChecker * 4)) : widthOfChecker,
            height: 4.0,
            margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.0),
            decoration: BoxDecoration(
              // shape: BoxShape.circle,
              borderRadius: BorderRadius.circular(40),
              color: activePage == index ? blue : greyc1,
            ),
          ),
        ),
      ),
    );
  }
}
