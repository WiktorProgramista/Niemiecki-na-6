import 'package:flutter/material.dart';
import 'package:niemiecki_na_6/screens/sentence_list_screen.dart';
import 'package:niemiecki_na_6/screens/words_screen.dart';

class Dialogs {
  void alert1(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text('SŁOWNIK',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
              content: Wrap(
                children: [
                  ListTile(
                    title: Text('SŁÓWKA',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700)),
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WordsListScreen()));
                    },
                  ),
                  ListTile(
                    title: Text('ZWROTY',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700)),
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SentenceListView()));
                    },
                  ),
                ],
              ),
            ));
  }
}
