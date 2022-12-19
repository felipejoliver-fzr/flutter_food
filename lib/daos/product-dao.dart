import 'package:path/path.dart';
import 'package:flutter_food/models/product.dart';
import 'package:sqflite/sqflite.dart';

class ProductDAO {
  Future<Database> getDatabase() async {
    Database db = await openDatabase(
        join(await getDatabasesPath(), 'product_database.db'),
        onCreate: ((db, version) {
      return db.execute(
          "CREATE TABLE Products(id INTEGER PRIMARY KEY, name TEXT, price REAL, quantity INTEGER, img TEXT)");
    }), version: 1);

    return db;
  }

  Future<List<Product>> readAll() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query("Products");

    final result = List.generate(maps.length, (index) {
      return Product(maps[index]['name'], maps[index]['price'],
          maps[index]['quantity'], maps[index]['img'],
          id: maps[index]['id']);
    });

    return result;
  }
}
