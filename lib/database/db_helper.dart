import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// This class manages all SQLite operations (CRUD)
class DBHelper {
  static Database? _db;

  // Database name
  static const String _dbName = 'orders.db';
  static const String _tableName = 'orders';

  // Columns
  static const String colId = 'id';
  static const String colProduct = 'product';
  static const String colQuantity = 'quantity';

  // Open database
  static Future<Database> getDB() async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  static Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    // Create table if not exists
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableName (
            $colId INTEGER PRIMARY KEY AUTOINCREMENT,
            $colProduct TEXT,
            $colQuantity INTEGER
          )
        ''');
      },
    );
  }

  // Insert new order
  static Future<int> insertOrder(Map<String, dynamic> order) async {
    final db = await getDB();
    return await db.insert(_tableName, order);
  }

  // Get all orders
  static Future<List<Map<String, dynamic>>> getOrders() async {
    final db = await getDB();
    return await db.query(_tableName);
  }

  // Delete an order
  static Future<int> deleteOrder(int id) async {
    final db = await getDB();
    return await db.delete(_tableName, where: '$colId = ?', whereArgs: [id]);
  }

  // Clear all orders
  static Future<void> clearOrders() async {
    final db = await getDB();
    await db.delete(_tableName);
  }
}
