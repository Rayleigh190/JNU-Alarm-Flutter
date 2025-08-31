import 'package:jnu_alarm/features/notice/models/notice_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'notices.db'),
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE notices(
            id INTEGER PRIMARY KEY, 
            title TEXT, 
            body TEXT, 
            link TEXT, 
            created_at TEXT, 
            is_read INTEGER
          )''',
        );
      },
      version: 1,
    );
  }

  static Future<Database> get database async {
    return _initDatabase();
  }

  static Future<List<NoticeModel>> fetchNotices(int offset, int limit) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'notices',
      orderBy: 'id DESC',
      limit: limit,
      offset: offset,
    );

    return List.generate(maps.length, (i) => NoticeModel.fromJson(maps[i]));
  }

  static Future<int> insertNotice(NoticeModel notice) async {
    final db = await database;
    return await db.insert(
      'notices',
      notice.toJson(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  static Future<int> deleteNotice(int id) async {
    final db = await database;
    return await db.delete(
      'notices',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<int> updateNoticeReadStatus(int id, int isRead) async {
    final db = await database;
    return await db.update(
      'notices',
      {'is_read': isRead == 1 ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<void> deleteDatabase() async {
    final path = join(await getDatabasesPath(), 'notices.db');
    await databaseFactory.deleteDatabase(path);
  }
}
