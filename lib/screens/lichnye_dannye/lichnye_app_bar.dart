import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/textStyles.dart';

Color gr = Color(0xff00CF91);
TextStyle tsgr_20_600_04 = TextStyle(
  color: gr,
  fontSize: 20,
  fontWeight: FontWeight.w600,
  fontFamily: 'Proxima Nova',
  letterSpacing: -0.41,
);
AppBar lichnyeAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: 50,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
    ),
    automaticallyImplyLeading: false,
    leading: leading_icon(context),
    backgroundColor: white,
    centerTitle: true,
    title: Container(
      alignment: Alignment.center,
      // margin: const EdgeInsets.only(top: 24.5, bottom: 20.5),
      child: Text(
        'Редактировать ',
        style: tsgr_20_600_04,
        // style: tsf4_16_600_0,
      ),
    ),
    // actions: [
    //   Container(
    //     margin: const EdgeInsets.only(right: 10, bottom: 10, top: 10),
    //     decoration: BoxDecoration(
    //       shape: BoxShape.circle,
    //       border: Border.all(
    //         color: gr,
    //         width: 1,
    //       ),
    //     ),
    //     child: const SizedBox(
    //       width: 22,
    //       height: 22,
    //       child: Image(
    //         image: AssetImage('assets/images/person_icon.png'),
    //         fit: BoxFit.contain,
    //       ),
    //     ),
    //   )
    // ],
  );
}

InkWell leading_icon(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.of(context).pop();
    },
    child: Container(
      // height: 16,
      margin: const EdgeInsets.only(left: 0, bottom: 0, right: 0, top: 0),
      // decoration: const BoxDecoration(
      //   color: whitef4,
      //   shape: BoxShape.circle,
      // ),
      // alignment: Alignment.center,
      child: const Icon(
        Icons.chevron_left,
        size: 30,
        color: black11,
      ),
    ),
  );
}
