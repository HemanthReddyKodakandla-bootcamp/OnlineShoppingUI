import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'shoes_modal.dart';

class ShoesDataBaseHelper {
  /// Here we create the instance of the class at the time of declaring the static data member,
  /// so instance of the class is created at the time of classloading.
  /// It represents Singleton Design pattern of Early instantiation
  static final ShoesDataBaseHelper _dataBaseHelperInstance =
  new ShoesDataBaseHelper.internal();

  ///Private constructor, it will prevent to instantiate the Singleton class from outside the class.

  /// Using private constructor we can ensure that no more than one object can be created at a time.
  /// By providing a private constructor you prevent class instances from being created in any place other than this very class.
  ShoesDataBaseHelper.internal();

  /// Use the factory keyword when implementing a constructor that doesn't always create a new instance of its class.
  /// For example, a factory constructor might return an instance from a cache, or it might return an instance of a subtype.
  factory ShoesDataBaseHelper() => _dataBaseHelperInstance;

  /// Database table name and it should be final and it should not be changed. That's why we declared as final
  final String ShoesTable = 'Shoes';

  /// Base class of Database from Sqflite plugin. It's an abstract class to send SQL commands for CRUD Operations
  static Database _ShoesDatabase;

  /// To perform asynchronous operations in Dart, you can use the Future class and the async and await keywords.
  ///
  /// refer to this link for better understanding of the Future, async and await keywords
  /// https://dart.dev/codelabs/async-await
  ///
  /// A future (lower case “f”) is an instance of the Future (capitalized “F”) class.
  /// A future represents the result of an asynchronous operation, and can have two states: uncompleted or completed.
  Future<Database> get db async {
    if (_ShoesDatabase != null) {
      return _ShoesDatabase;
    }
    _ShoesDatabase = await initDb();

    return _ShoesDatabase;
  }

  /// For async keyword, please refer to the below link
  /// https://dart.dev/guides/language/language-tour#asynchrony-support
  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'shoes.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  /// Method to create the DB with Database variable and Dbversion
  void _onCreate(Database db, int dbVersion) async {
    await db.execute(
        "CREATE TABLE $ShoesTable(title TEXT PRIMARY KEY, category TEXT, price TEXT, image TEXT, description TEXT, colors TEXT)");
  }

  /// Method to insert the data into DB with insert query by passing table name and model data
  Future<int> saveAttendeesDetails(Shoes shoe) async {
    var dbClient = await db;
    int result = await dbClient.insert(ShoesTable, shoe.toMap());
    return result;
  }

  /// Method to fetch all the user information from the Database using rawQuery
  Future<List<Shoes>> getUser() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Shoes');
    List<Shoes> shoesList = new List();
    for (int i = 0; i < list.length; i++) {
      var eachshoe = new Shoes(
        title: list[i]["title"],
        price:  list[i]["price"],
        description: list[i]["description"],
        category: list[i]["category"],
        colors: list[i]["colors"],
        image: list[i]["image"],
      );
      shoesList.add(eachshoe);
    }
    print("DB data.... " + shoesList.toString());
    return shoesList;
  }

  /// Method to fetch all the user information from the Database using rawQuery
  Future<int> deleteUsers(Shoes shoe) async {
    var dbClient = await db;
    int res = await dbClient
        .rawDelete('DELETE FROM Shoes WHERE title = ?', [shoe.title]);
    return res;
  }

  /// Method to delete all the user information from the Database using rawDelete
  Future<int> deleteAllUsers() async {
    var dbClient = await db;
    int res = await dbClient.rawDelete('DELETE FROM Shoes');
    return res;
  }

  /// Method to update the attendees information using update query.
  Future<bool> update(Shoes shoe) async {
    print(shoe.toMap());
    var dbClient = await db;
    int res = await dbClient.update("Shoes", shoe.toMap(),
        where: "title = ?", whereArgs: <String>[shoe.title]);
    print(res);
    return res > 0 ? true : false;
  }
}
