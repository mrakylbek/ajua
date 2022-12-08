// ignore_for_file: prefer_const_constructors

import 'package:ajua_namaz_1/screens/zikr/carousel_clider_zikr.dart';
import 'package:ajua_namaz_1/screens/zikr/carousel_djamat_zikr.dart';
import 'package:ajua_namaz_1/screens/zikr/carousel_number_zikr.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/textStyles.dart';
import '../kuran/audio_tile.dart';

BoxDecoration bd_wh_16 = BoxDecoration(
  color: white,
  borderRadius: BorderRadius.circular(16),
);
BoxDecoration bd_f9_16 = BoxDecoration(
  color: whitef9,
  borderRadius: BorderRadius.circular(16),
);

class ZikrTilePage extends StatefulWidget {
  const ZikrTilePage({super.key});

  @override
  State<ZikrTilePage> createState() => _ZikrTilePageState();
}

class _ZikrTilePageState extends State<ZikrTilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: endDrawer(),
      appBar: appBar('Саджа'),
      backgroundColor: whitef4,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                carouselBody(),
                Container(
                  margin: EdgeInsets.only(top: 12),
                  child: AudioTile(
                    containerColor: white,
                    trackColor: whitef9,
                    widthSlider: MediaQuery.of(context).size.width - 120,
                  ),
                ),
                Container(
                  child: CarouselZikrNumber(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget endDrawer() {
    return SafeArea(
      child: Container(
        color: whitef9,
        // width: MediaQuery.of(context).size.width - 50,
        margin: EdgeInsets.only(left: 50),
        padding: EdgeInsets.all(20),
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              drawerTop(),
              SizedBox(height: 20),
              Text(
                'Джамаат зикры',
                style: ts11_14_400_08,
              ),
              SizedBox(height: 6),
              CarouselDjamatZikr(
                tile_body: List.generate(
                  7,
                  (index) =>
                      // drawerTop(),
                      djamat_carousel_tile(index),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Джамаат зикры',
                style: ts11_14_400_08,
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  10,
                  (index) => drawerZikrTile(index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerZikrTile(int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => ZikrTilePage()),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        // width: MediaQuery.of(context).size.width - 110,
        // height: 63,
        // color: Colors.yellow,
        margin: EdgeInsets.symmetric(vertical: 6),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: index == 0 ? blue : white,
          // color: Colors.yellow,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 35,
              decoration: BoxDecoration(
                // color: blue,
                color: index != 0 ? blue : white,

                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 7),
              child: Text(
                (index + 1).toString(),
                style: index == 0
                    ? TextStyle(
                        fontSize: 16,
                        color: blue,
                        fontWeight: FontWeight.w600,
                      )
                    : tswh_16_600_0,
              ),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Таравих тасбих',
                  style: index == 0
                      ? TextStyle(
                          fontSize: 16,
                          color: white,
                          fontWeight: FontWeight.w600,
                        )
                      : ts11_14_700_08_el,
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 165,
                  child: Text(
                    '''Субхана зиль-мульки валь-малакут. Субхана зиль-'иззати валь-'азамати вmjksdmksdmk jefndvokf nvfedj''',
                    style: index == 0
                        ? TextStyle(
                            fontSize: 16,
                            color: white,
                            fontWeight: FontWeight.w600,
                          )
                        : ts87_14_400_0,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget djamat_carousel_tile(int index) {
    return Container(
      width: MediaQuery.of(context).size.width - 50 - 40,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: blue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          topOfDJamat(index),
          SizedBox(height: 8),
          SizedBox(
            width: MediaQuery.of(context).size.width - 50 - 40 - 20,
            child: Text(
              '1 000 000 000',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: white,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 1,
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Осталось',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: white,
                ),
              ),
              Text(
                '100%',
                style: tswh_16_600_0,
              ),
            ],
          )
        ],
      ),
    );
  }

  Row topOfDJamat(int index) {
    return Row(
      children: [
        Container(
          width: 30,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 7),
          child: Text(
            (index + 1).toString(),
            style: TextStyle(
              color: blue,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(width: 16),
        SizedBox(
          width: MediaQuery.of(context).size.width - 50 - 40 - 20 - 50,
          child: Text(
            'Таравих тасбих',
            style: tsf4_14_600_01,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
  //   children: List.generate(
  //     5,
  //     (index) => drawerTimeTile(index),
  //   ),

  Widget drawerTop() {
    return Row(
      children: [
        Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).closeEndDrawer();
              },
              icon: Icon(
                Icons.close,
                size: 24,
                color: black11,
              ),
            );
          },
        ),
        SizedBox(width: 20),
        Text(
          'Зикры',
          style: ts11_16_600_06,
        ),
      ],
    );
  }

  Widget carouselBody() {
    return Container(
      // height: 400,
      decoration: bd_wh_16,
      padding: EdgeInsets.symmetric(vertical: 12),
      child: CarouselZikr(
        tile_body: [
          carouselTile(
            true,
            'На арабском',
            'ذَٰلِكَ ٱلۡكِتَٰبُ لَا رَيۡبَۛ فِيهِۛ هُدٗى لِّلۡمُتَّقِينَ',
          ),
          carouselTile(
            false,
            'Транслит',
            'Bismi Al-Lahi Ar-Raĥmāni Ar-Raĥīmi',
          ),
          carouselTile(
            false,
            'Переведенный заголовок',
            'Во имя Аллаха, Милостивого, Милосердного!',
          ),
        ],
      ),
    );
  }

  // Widget audioBody() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         name,
  //         style: tsc1_14_400_08,
  //       ),
  //       SizedBox(height: 8),
  //       AudioTile(),
  //     ],
  //   );
  // }

  Column carouselTile(bool isArabic, String name, String txt) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            name,
            style: ts87_14_400_0,
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 330,
          decoration: bd_f9_16,
          margin: EdgeInsets.symmetric(horizontal: 12),
          padding: EdgeInsets.all(10),
          child: Center(
            child: Text(
              txt,
              textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
              maxLines: 500,
            ),
          ),
        )
      ],
    );
  }

  AppBar appBar(String name) {
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
        name,
        style: ts11_16_600_06,
      ),
      centerTitle: true,
      elevation: 0,
      actions: [
        Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              print('Tapped drawer');
              Scaffold.of(context).openEndDrawer();
            },
            icon: Icon(
              Icons.menu,
              size: 24,
              color: blue,
            ),
          );
        }),
      ],
    );
  }
}
