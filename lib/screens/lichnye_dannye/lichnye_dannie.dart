// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/textStyles.dart';

// import '../appBarCommon.dart';
// import '../data/models/profile_page_model.dart';
import 'lichnye_app_bar.dart';
import 'lichnye_body.dart';

// Color blue = Color(0xff009DBF);

class LichnyeDannye extends StatefulWidget {
  const LichnyeDannye({
    super.key,
    // this.profilePageModel,
  });
  // final ProfilePageModel? profilePageModel;

  @override
  State<LichnyeDannye> createState() => _LichnyeDannyeState();
}

class _LichnyeDannyeState extends State<LichnyeDannye> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: lichnyeAppBar(context),
      extendBody: true,
      // backgroundColor: const Color(0xffF1F2F2),
      backgroundColor: whitef4,
      floatingActionButton: elevButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: LichnyeBody(
            // profilePageModel: widget.profilePageModel!,
            ),
      ),
    );
  }

  ElevatedButton elevButton(BuildContext context) {
    return ElevatedButton(
      autofocus: true,
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        minimumSize: Size.zero, // Set this
        padding: EdgeInsets.zero, // and this
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width - 24,
        decoration: BoxDecoration(
          color: blue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          'Сохранить',
          textAlign: TextAlign.center,
          // style: TextStyle(
          //   fontSize: 20,
          //   fontWeight: FontWeight.w600,
          //   color: whitef4,
          // ),
          style: tsf4_20_600_0,
        ),
      ),
    );
  }
}
