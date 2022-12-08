import '../../constants/colors.dart';
import 'package:ajua_namaz_1/screens/lichnye_dannye/lichnye_app_bar.dart';
import 'package:ajua_namaz_1/screens/lichnye_dannye/lichnye_dannie.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselOfImage extends StatefulWidget {
  const CarouselOfImage({
    super.key,
    // required this.tile_body,
    required this.maxHeight,
    required this.maxWidth,
  });
  // final Widget tile_body;
  final double maxHeight;
  final double maxWidth;
  @override
  State<CarouselOfImage> createState() => _CarouselOfImageState();
}

List<String> images = [
  "niet.png",
  'takbir.png',
  'kiyam.png',
  'rukuh.png',
  'kiyamnan_turu.png',
  'sajde.png',
  'otyrys.png',
  'sajde.png',
  'otyrys.png',
  'salem_beru.png',
  'otyrys.png', // duga tileu bolu kerek
];
double widthOfChecker = ((200 - (images.length * 1)) / (images.length + 3)) - 8;

class _CarouselOfImageState extends State<CarouselOfImage> {
  late PageController _pageController;

  int activePage = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            // height: 140.0,
            height: widget.maxHeight - 20,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                activePage = index;
                print(index.toString());
              });
            },
          ),
          items: List.generate(
            images.length,
            // (index) => widget.tile_body,
            (index) => Container(
              width: widget.maxWidth,
              alignment: Alignment.bottomCenter,
              // color: blue,
              child: Image.asset(
                'assets/images/' + images[index],
                fit: BoxFit.contain,
                width: widget.maxWidth - 20,
              ),
            ),
          ),

          // images
          //     .map(
          //       (item) => Container(
          //         height: 160,
          //         decoration: BoxDecoration(
          //             color: Colors.amber[700],
          //             borderRadius: BorderRadius.circular(12),
          //             image: DecorationImage(
          //                 image: NetworkImage(item), fit: BoxFit.cover)),
          //       ),
          //     )
          //     .toList(),
        ),
        indexChecker(),
        // SizedBox(
        //   width: 164, //  2 + 160 + 2
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: images.map((urlOfItem) {
        //       int index = images.indexOf(urlOfItem);
        //       return Container(
        //         width: activePage == index ? 48.0 : 12.0,
        //         height: 4.0,
        //         margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 2.0),
        //         decoration: BoxDecoration(
        //           // shape: BoxShape.circle,
        //           borderRadius: BorderRadius.circular(20),
        //           color: activePage == index
        //               // ? Color(0xFF2DC36A)
        //               ? blue
        //               : Color(0xFFD9D9D9),
        //         ),
        //       );
        //     }).toList(),
        //   ),
        // )
      ],
    );
  }

  Widget indexChecker() {
    return Container(
      width: 200, //  2 + 160 + 2
      margin: EdgeInsets.symmetric(
          horizontal: ((widget.maxWidth - 200 - 32 - 40) / 2)),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          images.length,
          (index) => Container(
            // width: activePage == index ? 48.0 : 12.0,
            width:
                activePage == index ? ((widthOfChecker * 4)) : widthOfChecker,

            height: 4.0,
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
            decoration: BoxDecoration(
              // shape: BoxShape.circle,
              borderRadius: BorderRadius.circular(40),
              color: activePage == index
                  // ? Color(0xFF2DC36A)
                  ? blue
                  // : Color(0xFFD9D9D9),
                  : greyc1,
            ),
          ),
        ),

        //  images.map((urlOfItem) {
        //   int index = images.indexOf(urlOfItem);
        //   return Container(
        //     // width: activePage == index ? 48.0 : 12.0,
        //     width: activePage == index ? (widthOfChecker * 4) : widthOfChecker,

        //     height: 4.0,
        //     margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
        //     decoration: BoxDecoration(
        //       // shape: BoxShape.circle,
        //       borderRadius: BorderRadius.circular(40),
        //       color: activePage == index
        //           // ? Color(0xFF2DC36A)
        //           ? blue
        //           // : Color(0xFFD9D9D9),
        //           : greyc1,
        //     ),
        //   );
        // }).toList(),
      ),
    );
  }
}
