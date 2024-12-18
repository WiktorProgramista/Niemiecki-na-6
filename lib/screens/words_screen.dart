import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:niemiecki_na_6/db_helper.dart'; // Importuj swoją klasę DBHelper

class WordsListScreen extends StatefulWidget {
  const WordsListScreen({super.key});

  @override
  State<WordsListScreen> createState() => _WordsListScreenState();
}

class _WordsListScreenState extends State<WordsListScreen> {
  DBHelper dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Słówka", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: dbHelper.fetchWordList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No data found"));
          }

          // ListView, gdy dane zostały załadowane
          final records = snapshot.data!;
          return ListView.builder(
            itemCount: records.length,
            itemBuilder: (context, index) {
              final record = records[index];
              return ListTile(
                title: Text(record['language1'] ?? 'No language1'),
                subtitle: Text(record['language2'] ?? 'No language2'),
                onTap: () {
                  // Możesz dodać akcję przy tapnięciu na element
                  log('Tapped on: ${record['_id_dictionaryLevel1']}');
                },
              );
            },
          );
        },
      ),
    );
  }
}
