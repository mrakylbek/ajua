// ignore_for_file: prefer_const_constructors

import 'package:ajua_namaz_1/screens/kuran/audio_tile.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/textStyles.dart';

BoxDecoration bd_wh_16 = BoxDecoration(
  color: white,
  borderRadius: BorderRadius.circular(16),
);
BoxDecoration bd_f9_16 = BoxDecoration(
  color: whitef9,
  borderRadius: BorderRadius.circular(16),
);
String talkovanie = 'Во имя Аллаха, Милостивого, Милосердного! [['
    'Это означает: я начинаю во имя Аллаха. Из '
    'лексического анализа этого словосочетания ясно, что подразумеваются'
    ' все прекрасные имена Всевышнего Господа. Аллах - одно из этих'
    ' имен, означающее «Бог, Которого обожествляют и Которому поклоняются, '
    'Единственный, Кто заслуживает поклонения в силу Своих '
    'божественных качеств - качеств совершенства и безупречности». '
    'Прекрасные имена Милостивый и Милосердный свидетельствуют о '
    'Его великом милосердии, объемлющем всякую вещь и всякую тварь. '
    'Милосердия Аллаха в полной мере будут удостоены'
    ' Его богобоязненные рабы, которые следуют путем'
    ' Божьих пророков и посланников. А все остальные творения'
    ' получат лишь часть Божьей милости. '
    'Следует знать, что все праведные богословы'
    ' единодушно говорили о необходимости веры в Аллаха и Его'
    ' божественные качества. Господь - Милостивый и'
    ' Милосердный, то есть обладает милосердием, которое '
    'проявляется на Его рабах. Все блага и щедроты '
    'являются одним из многочисленных проявлений'
    ' Его милости и сострадания. То же самое можно сказать и об '
    'остальных именах Аллаха. Он всеведущ, то есть '
    'обладает знанием обо всем сущем. Он всемогущ, то есть '
    'обладает могуществом и властен над всякой тварью.]]';

class HomeSuraPage extends StatefulWidget {
  const HomeSuraPage({super.key});

  @override
  State<HomeSuraPage> createState() => _HomeSuraPageState();
}

class _HomeSuraPageState extends State<HomeSuraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: endDrawer(),
      appBar: appBar('Аль-Фатиха', '(Открывающая Коран)'),
      backgroundColor: whitef4,
      body: suraBody(),
    );
  }

  SafeArea suraBody() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: bd_wh_16,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Сура  ',
                      style: ts11_20_700_08_el,
                    ),
                    SizedBox(height: 16),
                    txt(
                      'На арабском',
                      'ذَٰلِكَ ٱلۡكِتَٰبُ لَا رَيۡبَۛ فِيهِۛ هُدٗى لِّلۡمُتَّقِينَ',
                      true,
                      false,
                    ),
                    txt(
                      'Переведенный заголовок',
                      'Во имя Аллаха, Милостивого, Милосердного!',
                      false,
                      true,
                    ),
                    txt(
                      'Транслит',
                      'Bismi Al-Lahi Ar-Raĥmāni Ar-Raĥīmi',
                      false,
                      false,
                    ),
                    audioBody(
                      'Аудио',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: bd_wh_16,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Толкование ас-Саади',
                      style: tsc1_14_400_08,
                    ),
                    SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      decoration: bd_f9_16,
                      margin: EdgeInsets.only(bottom: 12),
                      padding: EdgeInsets.all(16),
                      child: Text(
                        talkovanie,
                        style: ts33_12_500_08,
                        // overflow:,
                        maxLines: 100,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget audioBody(String name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: tsc1_14_400_08,
        ),
        SizedBox(height: 8),
        AudioTile(
          containerColor: whitef9,
          trackColor: white,
          widthSlider: MediaQuery.of(context).size.width - 160,
        ),
      ],
    );
  }

  Widget txt(String name, String text, bool isArab, bool isPerevod) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: tsc1_14_400_08,
        ),
        SizedBox(height: 8),
        Container(
          width: double.infinity,
          decoration: bd_f9_16,
          margin: EdgeInsets.only(bottom: 12),
          padding: EdgeInsets.all(16),
          child: Text(
            text,
            textDirection: isArab ? TextDirection.rtl : TextDirection.ltr,
            style: isArab
                ? TextStyle(
                    color: black11,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  )
                : isPerevod
                    ? ts33_12_600_08
                    : ts33_12_500_08,
            // overflow:,
            maxLines: 1000,
          ),
        ),
      ],
    );
  }

  Widget endDrawer() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: whitef9,
          margin: EdgeInsets.only(left: 50),
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              drawerTop(),
              SizedBox(height: 20),
              Text(
                'Список намазов',
                style: ts11_14_400_08,
              ),
              SizedBox(height: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  5,
                  (index) => drawerSuraTile(index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerSuraTile(int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => HomeSuraPage()),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 30,
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
                      'Фатиха',
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
                      width: MediaQuery.of(context).size.width - 160,
                      child: Text(
                        '(Открывающая Коран) ',
                        style: index == 0
                            ? TextStyle(
                                fontSize: 16,
                                color: white,
                                fontWeight: FontWeight.w600,
                              )
                            : ts87_14_400_0,
                        maxLines: 5,
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row drawerTop() {
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
          'Список намаз',
          style: ts11_16_600_06,
        ),
      ],
    );
  }

  AppBar appBar(String name, String pod_name) {
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
      title: Column(
        children: [
          Text(
            name,
            style: ts11_14_700_08_el,
          ),
          SizedBox(height: 5),
          Text(
            pod_name,
            style: ts87_14_400_0,
          ),
        ],
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
