import 'package:flutter/material.dart';

Color green = const Color(0xff009DBF);
// Color green = const Color(0xff00CF91);

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    double maxW = MediaQuery.of(context).size.width;
    List<BottomNavigationBarItem> navItems = [
      BottomNavigationBarItem(
        icon: Container(
          margin: EdgeInsets.only(right: (maxW - 40 - 100) / 2),
          child: Icon(
            Icons.compass_calibration_sharp,
            // Icons.account_circle,
            // size: 18,
            color: green,
          ),
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Container(
          margin: EdgeInsets.only(left: (maxW - 40 - 100) / 2),
          child: Icon(
            Icons.account_circle,
            color: green,
            // size: 18,
          ),
        ),
        label: 'Home',
      ),
    ];
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: BottomNavigationBar(
        currentIndex: 1,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 2,
        backgroundColor: Colors.white,
        // type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            // selectedI = value;
          });
        },
        iconSize: 30,
        items: navItems.map((it) {
          return it;
        }).toList(),
        // selectedIconTheme: IconThemeData(size: 30),
      ),
    );

    //  Container(
    //   width: double.infinity,
    //   height: 56,
    //   padding: EdgeInsets.only(
    //       top: this.navBarEssentials!.padding?.top ?? 0.0,
    //       left: this.navBarEssentials!.padding?.left ??
    //           MediaQuery.of(context).size.width * 0.05,
    //       right: this.navBarEssentials!.padding?.right ??
    //           MediaQuery.of(context).size.width * 0.05,
    //       bottom: this.navBarEssentials!.padding?.bottom ??
    //           this.navBarEssentials!.navBarHeight! * 0.1),
    //   child: Column(
    //     children: <Widget>[
    //       Row(
    //         children: <Widget>[
    //           AnimatedContainer(
    //             duration:
    //                 this.navBarEssentials!.itemAnimationProperties?.duration ??
    //                     Duration(milliseconds: 300),
    //             curve: this.navBarEssentials!.itemAnimationProperties?.curve ??
    //                 Curves.ease,
    //             color: Colors.transparent,
    //             width: this.navBarEssentials!.selectedIndex == 0
    //                 ? MediaQuery.of(context).size.width * 0.0
    //                 : itemSelectorWidth * this.navBarEssentials!.selectedIndex!,
    //             height: 4.0,
    //           ),
    //           Flexible(
    //             child: AnimatedContainer(
    //               duration: this
    //                       .navBarEssentials!
    //                       .itemAnimationProperties
    //                       ?.duration ??
    //                   Duration(milliseconds: 300),
    //               curve:
    //                   this.navBarEssentials!.itemAnimationProperties?.curve ??
    //                       Curves.ease,
    //               width: itemSelectorWidth,
    //               height: 4.0,
    //               alignment: Alignment.center,
    //               decoration: BoxDecoration(
    //                 color: selectedItemActiveColor,
    //                 borderRadius: BorderRadius.circular(100.0),
    //               ),
    //             ),
    //           )
    //         ],
    //       ),
    //       Expanded(
    //         child: Padding(
    //           padding: const EdgeInsets.only(top: 5.0),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceAround,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: this.navBarEssentials!.items!.map((item) {
    //               int index = this.navBarEssentials!.items!.indexOf(item);
    //               return Flexible(
    //                 child: GestureDetector(
    //                   onTap: () {
    //                     if (this.navBarEssentials!.items![index].onPressed !=
    //                         null) {
    //                       this.navBarEssentials!.items![index].onPressed!(this
    //                           .navBarEssentials!
    //                           .selectedScreenBuildContext);
    //                     } else {
    //                       this.navBarEssentials!.onItemSelected!(index);
    //                     }
    //                   },
    //                   child: Container(
    //                     color: Colors.transparent,
    //                     child: _buildItem(
    //                         item,
    //                         this.navBarEssentials!.selectedIndex == index,
    //                         this.navBarEssentials!.navBarHeight),
    //                   ),
    //                 ),
    //               );
    //             }).toList(),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
