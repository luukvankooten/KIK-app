import 'dart:async';
import 'package:kik/services/search.dart';
import 'package:sqflite/sqflite.dart';


class History {
	static final _databaseName = "history.db";
	static final _databaseVersion = 1;
	
	static final table = 'history';
	static final columnId = '_id';
	static final columnDescription = 'description';
	static final columnImg = 'img';
	
	History._privateConstructor();
	
	static final History instance = History._privateConstructor();
	
	static Database _database;
	
	Future<Database> get database async {
		if (_database != null) {
			return _database;
		}
			
		_database = await _initDatabase();
		return _database;
	}
	
	Future<Database> _initDatabase() async {
		String databasesPath = await getDatabasesPath();
		String path = databasesPath + _databaseName;
		
		return await openDatabase(path,
			version: _databaseVersion,
			onCreate: _onCreate
		);
	}
	
	Future _onCreate(Database db, int version) async {
		await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnDescription TEXT NOT NULL,
            $columnImg TEXT NOT NULL
          )
          '''
		);
	}
	
	Future<int> insert(Result result) async {
		Database db = await instance.database;
		
		return await db.insert(table, {
			columnDescription: result.description,
			columnImg: result.imgPath,
		});
	}
	
	Future<List<Result>> queryAllRows() async {
		Database db = await instance.database;
		var results = await db.query(table);
		
		return results.map<Result>((result) => Result(
			description: result[columnDescription],
			imgPath: result[columnImg]
		)).toList();
	}
	
}