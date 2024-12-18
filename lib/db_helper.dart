import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();

  factory DBHelper() => _instance;

  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  // Funkcja uzyskująca ścieżkę bazy danych
  Future<String> copyDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    final dbPath = join(directory.path, "myDb.db");

    var dbFile = File(dbPath);
    if (await dbFile.exists()) {
      return dbPath; // Jeśli plik już istnieje, zwróć ścieżkę
    }

    // Kopiowanie pliku bazy danych z assets do katalogu aplikacji
    final ByteData data = await rootBundle.load('assets/databases/myDb.db');
    final List<int> bytes = data.buffer.asUint8List();
    await dbFile.writeAsBytes(bytes); // Zapisz plik do katalogu aplikacji
    return dbPath;
  }

  // Funkcja inicjalizująca bazę danych
  Future<Database> initDb() async {
    String dbPath = await copyDatabase();
    return await openDatabase(dbPath, version: 1);
  }

  // Funkcja pobierająca słowka z tabeli
  Future<List<Map<String, dynamic>>> fetchWordList() async {
    final dbClient = await db;
    return await dbClient.query('android_dictionary_level_one');
  }

  // Funkcja pobierająca zdania z tabeli
  Future<List<Map<String, dynamic>>> fetchSentenceList() async {
    final dbClient = await db;
    return await dbClient.query('android_dictionary_level_two');
  }
}
