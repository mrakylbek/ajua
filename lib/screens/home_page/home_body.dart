// ignore_for_file: prefer_const_constructors

import 'package:ajua_namaz_1/models/today_pray_times_model.dart';
import 'package:ajua_namaz_1/screens/home_page/first_column.dart';
import 'package:ajua_namaz_1/screens/home_page/second_column.dart';
import 'package:flutter/material.dart';

// import 'package:ajua_namaz_1/constants/textStyles.dart';
// import 'package:ajua_namaz_1/screens/home_page/alert_nachat.dart';
import 'package:ajua_namaz_1/screens/home_page/alert_vremya.dart';
import 'package:ajua_namaz_1/screens/home_page/carousel_clider.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../bottomNavBar.dart';
import '../../constants/colors.dart';
// import 'bloc/get_pray_times_bloc.dart';

TextStyle ts = const TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: Color(0xff333333),
);
// Color green = const Color(0xff00CF91);
// List vremya = [
//   'Фаджр',
//   // 'Восход',
//   'Зухр',
//   'Аср',
//   'Магриб',
//   'Иша',
// ];
// bool turn = true;
// List<bool> soundOnOff = [false, true, false, true, false];
int today = DateTime.now().day;
int month = DateTime.now().month;
int weekDay = DateTime.now().weekday;

class HomeBody extends StatefulWidget {
  const HomeBody({super.key, required this.isLoaded, this.tr, this.callBloc});
  final bool isLoaded;
  final TodayPrayTimesModel? tr;
  final Function? callBloc;

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  // TodayPrayTimesModel? tr;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('HOMEBODY ISLOADDED ' + widget.isLoaded.toString());
    // context.read<GetPrayTimesBloc>().add(GetPrayTimesLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    // return BlocBuilder<GetPrayTimesBloc, GetPrayTimesState>(
    //     builder: (context, state) {
    //   if (state is GetPrayTimesLoaded) {
    //     // setState(() {
    //     tr = state.tr;
    //     // });
    //   }
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // appBar2(),
              // if (widget.isLoaded)
              Container(
                // height: 467,
                // color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // firstColumn(maxWidth),
                    widget.isLoaded
                        ? FirstColumn(
                            isLoaded: widget.isLoaded,
                            maxW: maxWidth,
                            tr: widget.tr!,
                            callBloc: widget.callBloc,
                          )
                        : Column(
                            children: [
                              SizedBox(
                                width: (maxWidth - 40 - 25) / 2,
                                child: Image(
                                  image:
                                      AssetImage('assets/images/mosque_1.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(
                                height: 370.h,
                                width: (maxWidth - 40 - 25) / 2,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 167.h,
                                      width: double.infinity,
                                      color: white,
                                      // padding: EdgeInsets.all(50),
                                      child: Center(
                                        child: CircularProgressIndicator(
                                            color: blue),
                                      ),
                                    ),
                                    Container(
                                      height: 167.h,
                                      width: double.infinity,
                                      color: white,
                                      // padding: EdgeInsets.all(50),
                                      child: Center(
                                        child: CircularProgressIndicator(
                                            color: blue),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                    // secondColumn(maxWidth),
                    widget.isLoaded
                        ? SecondColumn(
                            isLoaded: widget.isLoaded,
                            maxW: maxWidth,
                            // tr: widget.tr!,
                            tr: widget.tr!,
                          )
                        : Column(
                            children: [
                              SizedBox(
                                width: (maxWidth - 40 - 25) / 2,
                                child: Image(
                                  image:
                                      AssetImage('assets/images/mosque_2.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(
                                height: 370.h,
                                width: (maxWidth - 40 - 25) / 2,
                                child: Container(
                                  height: 370.h,
                                  width: double.infinity,
                                  color: white,
                                  padding: EdgeInsets.all(50),
                                  alignment: Alignment.center,
                                  child: CircularProgressIndicator(color: blue),
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              )
              // else
              //   Container(
              //     height: 450.h,
              //     child: Center(
              //       child: CircularProgressIndicator(color: blue),
              //     ),
              //   )
              // else
              //   Container(
              //     margin: EdgeInsets.only(top: 100),
              //     alignment: Alignment.center,
              //     child: CircularProgressIndicator(color: blue),
              //   )
              //
              ,
              if (widget.isLoaded)
                CarouselBody(
                  tile_body: carousel_tile(),
                )
              else
                Container(
                  width: double.infinity,
                  height: 140.0.h,
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 5),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(color: blue),
                ),
              Container(
                width: 150,
                height: 75,
                // color: Colors.yellow,
              ),
            ],
          ),
        ),
      ),
    );
  }
  // ,

  // );
}

Container carousel_tile() {
  return Container(
    // height: 120,
    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 5),
    margin: EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 138.w,
          height: 109.h,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/ramadan.png'),
            fit: BoxFit.contain,
          )),
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Рамаданга',
                maxLines: 2,
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
                  color: blue,
                  fontFamily: 'Open Sans',
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 15)
      ],
    ),
  );
}
// }
