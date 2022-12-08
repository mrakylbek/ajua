import '../../constants/colors.dart';
import 'package:ajua_namaz_1/screens/lichnye_dannye/lichnye_app_bar.dart';
import 'package:ajua_namaz_1/screens/lichnye_dannye/lichnye_dannie.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselBody extends StatefulWidget {
  const CarouselBody({super.key, required this.tile_body});
  final Widget tile_body;
  @override
  State<CarouselBody> createState() => _CarouselBodyState();
}

class _CarouselBodyState extends State<CarouselBody> {
  late PageController _pageController;
  List<String> images = [
    "https://wallpaperaccess.com/full/8405169.jpg",
    "https://wallpaperaccess.com/full/791.jpg",
    "https://wallpaperaccess.com/full/840565169.jpg",
    "https://wallpaperaccess.com/full/72191.jpg",
    "https://wallpaperaccess.com/full/128130.jpg",
    "https://wallpaperaccess.com/full/8405159.jpg",
    "https://wallpaperaccess.com/full/2637581.jpg",
    "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
  ];
  int activePage = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                height: 140.0,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1,
                onPageChanged: ((index, reason) {
                  setState(() {
                    activePage = index;
                  });
                })),
            items: List.generate(8, (index) => widget.tile_body),

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
          SizedBox(
            width: 164, //  2 + 160 + 2
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.map((urlOfItem) {
                int index = images.indexOf(urlOfItem);
                return Container(
                  width: activePage == index ? 48.0 : 12.0,
                  height: 4.0,
                  margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    // shape: BoxShape.circle,
                    borderRadius: BorderRadius.circular(20),
                    color: activePage == index
                        // ? Color(0xFF2DC36A)
                        ? blue
                        : Color(0xFFD9D9D9),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
