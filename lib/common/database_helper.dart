import 'dart:ffi';

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
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute(
              "ALTER TABLE notices ADD COLUMN is_bookmarked INTEGER DEFAULT 0");
        }
      },
      version: 2,
    );
  }

  static Future<Database> get database async {
    return _initDatabase();
  }

  static Future<List<NoticeModel>> fetchNotices(int offset, int limit,
      {bool? isBookmarked, bool? isRead}) async {
    final db = await database;

    final List<String> conditions = [];
    final List<Object?> args = [];

    if (isBookmarked != null) {
      conditions.add("is_bookmarked = ?");
      args.add(isBookmarked ? 1 : 0);
    }

    if (isRead != null) {
      conditions.add("is_read = ?");
      args.add(isRead ? 1 : 0);
    }

    final where = conditions.isNotEmpty ? conditions.join(" AND ") : null;

    final List<Map<String, dynamic>> maps = await db.query(
      'notices',
      orderBy: 'id DESC',
      limit: limit,
      offset: offset,
      where: where,
      whereArgs: args,
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
