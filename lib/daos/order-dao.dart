import 'package:flutter_food/models/order.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class OrderDAO {
  Future<Database> getDatabase() async {
    Database db =
        await openDatabase(join(await getDatabasesPath(), 'order_database.db'),
            onCreate: ((db, version) {
      return db.execute(
          "CREATE TABLE Orders(id INTEGER PRIMARY KEY, clientName TEXT, items TEXT)");
    }), version: 1);

    return db;
  }

  Future<List<Order>> readAll() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query("Orders");

    final result = List.generate(maps.length, (index) {
      return Order(maps[index]['clientName'], maps[index]['items'],
          id: maps[index]['id']);
    });

    return result;
  }

  Future<int> insertOrder(Order order) async {
    final db = await getDatabase();
    return db.insert("Orders", order.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
