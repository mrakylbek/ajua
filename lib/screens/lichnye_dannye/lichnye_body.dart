// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/textStyles.dart';
// import '../data/models/profile_page_model.dart';

bool isWritten = false;

int countPhone = 1;

// String initValue = "Select your Birth Date";
bool hasImage = false;
bool isDateSelected = false;
String? birthDateInString;
DateTime birthDateInit = DateTime.now();
String birthDay = '27';
String birthMonth = 'Март';
String birthYear = '1994';
TextEditingController nameController = TextEditingController();
TextEditingController familyController = TextEditingController();
TextEditingController birthDayController =
    TextEditingController(text: birthDay);
// TextEditingController birthMonth = TextEditingController();
TextEditingController phoneController =
    TextEditingController(text: '+ 7 707 188 1834');
// Color color_green = const Color(0xff2DC36A);
BorderSide bs = BorderSide(
  color: Color(0xffE9E9E9),
  width: 1,
);
BorderRadius br16 = BorderRadius.circular(16);

class LichnyeBody extends StatefulWidget {
  const LichnyeBody({
    super.key,
    // this.profilePageModel,
  });
  // final ProfilePageModel? profilePageModel;

  @override
  State<LichnyeBody> createState() => _LichnyeBodyState();
}

class _LichnyeBodyState extends State<LichnyeBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // nameController = TextEditingController(text: widget.profilePageModel!.name);
    nameController = TextEditingController(text: 'Akylbek');
  }

  @override
  Widget build(BuildContext context) {
    double maxW = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            photo(maxW),
            name_phone_data(maxW),
          ],
        ),
      ),
    );
  }

  Container name_phone_data(double maxW) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          name(maxW),
          const SizedBox(height: 18),
          phone(maxW),
          // const SizedBox(height: 12),
          birth_date_widget(maxW),
          const SizedBox(height: 12),

          // SizedBox(
          //   width: (maxW - 50) / 2,
          //   height: 150,
          // )
        ],
      ),
    );
  }

  Container birth_date_widget(double maxW) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Дата рождения',
            // style: TextStyle(
            //   fontSize: 16,
            //   fontWeight: FontWeight.w600,
            //   color: black33,
            // ),
            style: ts33_16_600_1,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              birthDayText(maxW, birthDay),
              birthMonthText(maxW, birthMonth),
              birthYearText(maxW, birthYear)
              // bithDate(maxW, false, '27'),
              // bithDate(maxW, true, 'Марта'),
              // bithDate(maxW, true, '1994'),
            ],
          )
        ],
      ),
    );
  }

  // Widget bithDate(double maxW, bool hasI, String txt) {
  Widget birthDayText(double maxW, String txt) {
    return Container(
      width: (maxW - 24 - 24) / 3,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(5),
        // borderSide: BorderSide.none,
        // borderSide: bs,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            txt,
            // style: const TextStyle(
            //   fontSize: 16,
            //   fontWeight: FontWeight.w500,
            //   color: black33,
            // ),
            style: ts33_16_500_0,
          ),
        ],
      ),
    );
  }

  Widget birthMonthText(double maxW, String txt) {
    selecetDateTime() async {
      final datePick = await showDatePicker(
          context: context,
          initialDate: new DateTime.now(),
          firstDate: new DateTime(1900),
          lastDate: new DateTime(2100));
      if (datePick != null && datePick != birthDayText) {
        setState(() {
          birthDateInit = datePick;
          isDateSelected = true;
          birthDay = birthDateInit.day.toString();
          birthMonth = birthDateInit.month.toString();
          birthYear = birthDateInit.year.toString();

          // put it here
          // birthDateInString =
          //     "${birthDate.month}/${birthDate.day}/${birthDate.year}"; // 08/14/2019
        });
      }
    }

    return GestureDetector(
      onTap: selecetDateTime,
      child: Container(
        width: (maxW - 24 - 24) / 3,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(5),
          // borderSide: BorderSide.none,
          // borderSide: bs,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              txt,
              // style: const TextStyle(
              //   fontSize: 16,
              //   fontWeight: FontWeight.w500,
              //   color: black33,
              // ),
              style: ts33_16_500_0,
            ),
            // hasI
            //     ?
            const Icon(
              Icons.keyboard_arrow_down,
              size: 12,
              color: color_green,
            )
            //     : const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }

  Widget birthYearText(double maxW, String txt) {
    selecetDateTime() async {
      final datePick = await showDatePicker(
          context: context,
          initialDate: new DateTime.now(),
          firstDate: new DateTime(1900),
          lastDate: new DateTime(2100));
      if (datePick != null && datePick != birthDayText) {
        setState(() {
          birthDateInit = datePick;
          isDateSelected = true;
          birthDay = birthDateInit.day.toString();
          birthMonth = birthDateInit.month.toString();
          birthYear = birthDateInit.year.toString();

          // put it here
          // birthDateInString =
          //     "${birthDate.month}/${birthDate.day}/${birthDate.year}"; // 08/14/2019
        });
      }
    }

    return GestureDetector(
      onTap: selecetDateTime,
      child: Container(
        width: (maxW - 24 - 24) / 3,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(5),
          // borderSide: BorderSide.none,
          // borderSide: bs,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              txt,
              // style: const TextStyle(
              //   fontSize: 16,
              //   fontWeight: FontWeight.w500,
              //   color: black33,
              // ),
              style: ts33_16_500_0,
            ),
            // hasI
            //     ?
            const Icon(
              Icons.keyboard_arrow_down,
              size: 12,
              color: color_green,
            )
            //     : const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }

  Widget name(double maxWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Имя', style: ts33_16_600_1),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          // height: 40,
          decoration: BoxDecoration(
            color: white,
            // borderRadius: BorderRadius.circular(16),
            borderRadius: br16,
          ),
          // padding: const EdgeInsets.symmetric(vertical: 5),
          child: TextField(
            controller: nameController,
            style: ts33_16_600_1,
            keyboardType: TextInputType.name,
            // inputFormatters: <TextInputFormatter>[
            //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            //   FilteringTextInputFormatter.digitsOnly
            // ],
            onChanged: (value) {
              print(nameController.text);
              // !isWritten
              //     ? nameController.text.isNotEmpty
              //         ? widget.stButton()
              //         : null
              //     : null;
              // setState(() {
              //   isWritten = true;
              //   if (nameController.text.isEmpty &&
              //       phoneController.text.isEmpty) {
              //     widget.stButton();
              //     isWritten = false;
              //   }
              // });
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              focusedBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(16),
                borderRadius: br16,
                borderSide: BorderSide.none,
                // borderSide: bs,
              ),
              filled: true,
              fillColor: white,
              enabledBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(16),
                borderRadius: br16,
                // borderSide: const BorderSide(color: Color(0xffF0F0F0)),
                borderSide: BorderSide.none,
                // borderSide: bs,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget phone(double maxWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Телефон', style: ts33_16_600_1),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          // height: 40,
          decoration: BoxDecoration(
            color: white,
            // borderRadius: BorderRadius.circular(16),
            borderRadius: br16,
          ),
          // padding: const EdgeInsets.symmetric(vertical: 5),
          child: TextField(
            controller: phoneController,
            style: ts33_16_600_1,
            keyboardType: TextInputType.phone,
            // inputFormatters: <TextInputFormatter>[
            //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            //   FilteringTextInputFormatter.digitsOnly
            // ],
            onChanged: (value) {
              print(phoneController.text);
              // !isWritten
              //     ? nameController.text.isNotEmpty
              //         ? widget.stButton()
              //         : null
              //     : null;
              // setState(() {
              //   isWritten = true;
              //   if (nameController.text.isEmpty &&
              //       phoneController.text.isEmpty) {
              //     widget.stButton();
              //     isWritten = false;
              //   }
              // });
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              focusedBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(16),
                borderRadius: br16,
                borderSide: BorderSide.none,
                // borderSide: bs,
              ),
              filled: true,
              fillColor: white,
              enabledBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(16),
                borderRadius: br16,
                // borderSide: const BorderSide(color: Color(0xffF0F0F0)),
                borderSide: BorderSide.none,
                // borderSide: bs,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column photo(double maxW) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        // Container(
        //   margin: const EdgeInsets.symmetric(vertical: 24),
        //   child: Text(
        //     'Личные данные',
        //     // style: TextStyle(
        //     //   fontSize: 20,
        //     //   fontWeight: FontWeight.w600,
        //     //   letterSpacing: 0.5,
        //     //   color: black11,
        //     // ),
        //     style: ts11_20_600_05,
        //   ),
        // ),
        Container(
          width: 80,
          height: 80,
          // margin: EdgeInsets.symmetric(horizontal: (maxW - 120 - 24) / 2),
          decoration: BoxDecoration(
            color: Color(0xffE7F3F2),
            // shape: BoxShape.circle,
            borderRadius: BorderRadius.circular(24),
            image: hasImage
                ? DecorationImage(
                    image: AssetImage('assets/images/ramadan.png'),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: hasImage
              ? SizedBox()
              : Center(
                  child: Text(
                    'A',
                    style: TextStyle(
                      fontSize: 37,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff3EAFA7),
                    ),
                  ),
                ),
          // child: CircleAvatar(
          //   // backgroundImage: NetworkImage(
          //   //     _baseUrlToImage + widget.profilePageModel!.urlToAvatar),
          //   backgroundImage: AssetImage('assets/images/ramadan.png'),
          //   radius: 45,
          // ),
        ),
      ],
    );
  }
}
