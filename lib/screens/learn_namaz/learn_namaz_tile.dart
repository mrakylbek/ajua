// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/textStyles.dart';

BoxDecoration bd_wh_20 = BoxDecoration(
  color: white,
  borderRadius: BorderRadius.circular(20),
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

class HomeNamazTile extends StatefulWidget {
  const HomeNamazTile({super.key});

  @override
  State<HomeNamazTile> createState() => _HomeNamazTileState();
}

class _HomeNamazTileState extends State<HomeNamazTile> {
  GlobalKey<ScaffoldState> drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: endDrawer(),
      appBar: appBar('Тан намаз'),
      backgroundColor: whitef4,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              image('Ният', 'niet.png'),
              readText(
                'Аль-фатиха',
                'Бисмил-ляяхи ррахмаани ррахиим.Аль-хамду лил-ляяхи'
                    ' раббиль-‘аалямиин.Ар-рахмаани ррахиим.Мяялики '
                    'яумид-диин.Ийяякя на’буду ва ийяякя наста’иин.'
                    'Ихдина ссырааталь-мустакыим.Сыраатол-лязийна'
                    ' ан’амта ‘аляйхим, гайриль-магдууби ‘аляйхим'
                    ' ва ляд-дооллиин. Амин',
              ),
              image('Стояние (кыям)', 'kiyam.png'),
              readText(
                'Ыкылас суреси',
                'Қул һуаллаһу ахад, Аллаһус самад, ләм иәлид'
                    ' уә ләм иуләд, уә ләм иәкул ләһу куфуан ахад',
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget endDrawer() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: whitef9,
          // width: 100,
          margin: EdgeInsets.only(left: 50),
          padding: EdgeInsets.all(20),
          // height: double.infinity,
          height: MediaQuery.of(context).size.height,
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
                  (index) => drawerTimeTile(index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerTimeTile(int index) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => HomeNamazTile()),
        ),
      ),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 6),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 114,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 30,
                            decoration: BoxDecoration(
                              color: blue,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 7),
                            child: Text(
                              (index + 1).toString(),
                              style: tswh_16_600_0,
                            ),
                          ),
                          SizedBox(width: 16),
                          Text(
                            'Тан намаз',
                            style: ts11_14_700_08_el,
                          ),
                        ],
                      ),
                      Text(
                        '06:08',
                        style: ts55_12_400_0,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 114,
                  child: Wrap(
                    children: List.generate(
                      3,
                      (index) => Text(
                        '• 2 ракаат суннет  ',
                        style: ts87_14_400_0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Icon(
            //   Icons.chevron_right,
            //   size: 24,
            //   color: black11,
            // )
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

  Column readText(String nameSura, String txtOfSura) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nameSura,
          style: ts11_16_600_06,
        ),
        SizedBox(height: 12),
        Container(
          decoration: bd_wh_20,
          padding: EdgeInsets.all(16),
          child: txt(
            'Транскрипция',
            txtOfSura,
          ),
        ),
      ],
    );
  }

  Widget image(String name, String urlImage) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: bd_wh_20,
      child: Column(
        children: [
          Text(
            name,
            style: ts33_14_600_0,
          ),
          SizedBox(height: 10),
          Image(
            image: AssetImage('assets/images/$urlImage'),
            width: 100,
            height: 250,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }

  Widget txt(String name, String text) {
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
            style: ts33_12_500_08,
            // overflow:,
            maxLines: 1000,
          ),
        ),
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
