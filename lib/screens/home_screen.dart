import 'package:flutter/material.dart';
import 'package:niemiecki_na_6/constants.dart';
import 'package:niemiecki_na_6/db_helper.dart';
import 'package:niemiecki_na_6/dialogs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Dialogs dialogs = Dialogs();
  DBHelper dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Container(
              width: width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/keep-calm.png'),
                fit: BoxFit.cover,
              )),
            ),
          ),
          onlineCourse(),
          basicCourse(),
          bottomButtons()
        ],
      )),
    );
  }

  Widget onlineCourse() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            color: Colors.white),
        child: Column(
          spacing: 3.0,
          children: [
            Text('KURS ONLINE'),
            SizedBox(
              width: double.infinity,
              child: myButton(
                'SŁÓWKA DNIA',
                kPrimaryColor,
                () {},
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: myButton(
                'ZESTAW SŁÓWEK Z TYGODNIA',
                kSecondaryColor,
                () {},
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget basicCourse() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            color: Colors.white),
        child: Column(
          spacing: 3.0,
          children: [
            Text('KURS PODSTAWOWY'),
            Row(
              spacing: 3.0,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: myButton(
                    'NAUKA SŁÓWEK',
                    kPrimaryColor,
                    () {},
                  ),
                ),
                Expanded(
                  child: myButton(
                    'NAUKA ZWROTÓW',
                    kPrimaryColor,
                    () {},
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child:
                  myButton('SŁÓWKA DO ZALICZENIA (0)', kSecondaryColor, () {}),
            )
          ],
        ),
      ),
    );
  }

  Widget bottomButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(
        spacing: 3.0,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: myButton(
                'SŁOWNIK', Colors.green, () => dialogs.alert1(context)),
          ),
          Expanded(child: myButton('PODSUMOWANIE', Colors.red, () async {}))
        ],
      ),
    );
  }

  myButton(String text, Color bgColor, Function fun) {
    return SizedBox(
      height: 50.0,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              backgroundColor: bgColor),
          onPressed: () => fun(),
          child: Text(text,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 15.0))),
    );
  }
}
