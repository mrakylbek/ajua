import 'package:ajua_namaz_1/constants/colors.dart';
import 'package:ajua_namaz_1/screens/fanjr/homeFanjr.dart';
import 'package:ajua_namaz_1/screens/home_page/bloc/get_pray_times_bloc.dart';
import 'package:ajua_namaz_1/screens/home_page/home_page.dart';
import 'package:ajua_namaz_1/screens/home_page/switch_bloc/switch_notification_bloc.dart';
import 'package:ajua_namaz_1/screens/kuran/home_kuran.dart';
import 'package:ajua_namaz_1/screens/learn_namaz/home_learn_namaz.dart';
import 'package:ajua_namaz_1/screens/learn_namaz/learn_namaz_tile.dart';
import 'package:ajua_namaz_1/screens/lichnye_dannye/lichnye_dannie.dart';
import 'package:ajua_namaz_1/screens/tablitsa_for_month/bloc/calendar_bloc.dart';
import 'package:ajua_namaz_1/screens/zikr/home_zikr_page.dart';
import 'package:ajua_namaz_1/screens/zikr/zikr_tile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screens/kuran/home_sura_page.dart';
import 'screens/tablitsa_for_month/home_tablitsa_for_month.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CalendarBloc>(create: (context) => CalendarBloc()),
        BlocProvider<GetPrayTimesBloc>(create: (context) => GetPrayTimesBloc()),
        BlocProvider<SwitchNotificationBloc>(
            create: (context) => SwitchNotificationBloc()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(390, 844),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, Widget? child) {
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                // This is the theme of your application.
                //
                // Try running your application with "flutter run". You'll see the
                // application has a blue toolbar. Then, without quitting the app, try
                // changing the primarySwatch below to Colors.green and then invoke
                // "hot reload" (press "r" in the console where you ran "flutter run",
                // or simply save your changes to "hot reload" in a Flutter IDE).
                // Notice that the counter didn't reset back to zero; the application
                // is not restarted.
                primarySwatch: Colors.blue,
                // appBarTheme: AppBarTheme(color: white.withOpacity(0)),
              ),
              home: HomePage(),
              // home: TablitsaMonth(),
            );
          }),
    );
  }
}
