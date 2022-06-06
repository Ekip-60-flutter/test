import 'dart:developer';
import 'package:newnew/pages/home/note_item.dart';
import 'package:newnew/shared/database/app_database.dart';
import 'package:sembast/sembast.dart';

class DatabaseDao {
  static const String folderName = "notes";
  final _booksFolder = intMapStoreFactory.store(folderName);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insertItem(NoteItem item) async {
    var a = await _booksFolder.add(await _db, item.toJson());
  }

  Future updateItem(NoteItem item) async {
    final finder = Finder(filter: Filter.matches('desc', item.desc!));
    await _booksFolder.update(await _db, item.toJson(), finder: finder);
  }

  Future delete(NoteItem item) async {
    final finder = Finder(filter: Filter.matches('desc', item.desc!));
    await _booksFolder.delete(await _db, finder: finder);
  }

  Future<List<NoteItem>> getAllItems() async {
    final recordSnapshot = await _booksFolder.find(await _db);
    return recordSnapshot.map((snapshot) {
      final item = NoteItem.fromJson(snapshot.value);
      return item;
    }).toList();
  }

  Future deleteAll() async {
    await _booksFolder.delete(await _db);
  }
}
