import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'bags_modal.dart';

class BagsDataBaseHelper {
  /// Here we create the instance of the class at the time of declaring the static data member,
  /// so instance of the class is created at the time of classloading.
  /// It represents Singleton Design pattern of Early instantiation
  static final BagsDataBaseHelper _dataBaseHelperInstance =
  new BagsDataBaseHelper.internal();

  ///Private constructor, it will prevent to instantiate the Singleton class from outside the class.

  /// Using private constructor we can ensure that no more than one object can be created at a time.
  /// By providing a private constructor you prevent class instances from being created in any place other than this very class.
  BagsDataBaseHelper.internal();

  /// Use the factory keyword when implementing a constructor that doesn't always create a new instance of its class.
  /// For example, a factory constructor might return an instance from a cache, or it might return an instance of a subtype.
  factory BagsDataBaseHelper() => _dataBaseHelperInstance;

  /// Database table name and it should be final and it should not be changed. That's why we declared as final
  final String BagsTable = 'Bags';

  /// Base class of Database from Sqflite plugin. It's an abstract class to send SQL commands for CRUD Operations
  static Database _BagsDatabase;

  /// To perform asynchronous operations in Dart, you can use the Future class and the async and await keywords.
  ///
  /// refer to this link for better understanding of the Future, async and await keywords
  /// https://dart.dev/codelabs/async-await
  ///
  /// A future (lower case “f”) is an instance of the Future (capitalized “F”) class.
  /// A future represents the result of an asynchronous operation, and can have two states: uncompleted or completed.
  Future<Database> get db async {
    if (_BagsDatabase != null) {
      return _BagsDatabase;
    }
    _BagsDatabase = await initDb();

    return _BagsDatabase;
  }

  /// For async keyword, please refer to the below link
  /// https://dart.dev/guides/language/language-tour#asynchrony-support
  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'bags.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  /// Method to create the DB with Database variable and Dbversion
  void _onCreate(Database db, int dbVersion) async {
    await db.execute(
        "CREATE TABLE $BagsTable(title TEXT PRIMARY KEY, category TEXT, price TEXT, image TEXT, description TEXT, colors TEXT)");
  }

  /// Method to insert the data into DB with insert query by passing table name and model data
  Future<int> saveAttendeesDetails(Bags bag) async {
    var dbClient = await db;
    int result = await dbClient.insert(BagsTable, bag.toMap());
    return result;
  }

  /// Method to fetch all the user information from the Database using rawQuery
  Future<List<Bags>> getUser() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Bags');
    List<Bags> bagsList = new List();
    for (int i = 0; i < list.length; i++) {
      var eachBag = new Bags(
        title: list[i]["title"],
        price:  list[i]["price"],
        description: list[i]["description"],
        category: list[i]["category"],
        colors: list[i]["colors"],
        image: list[i]["image"],
      );
      bagsList.add(eachBag);
    }
    print("DB data.... " + bagsList.toString());
    return bagsList;
  }

  /// Method to fetch all the user information from the Database using rawQuery
  Future<int> deleteUsers(Bags bag) async {
    var dbClient = await db;
    int res = await dbClient
        .rawDelete('DELETE FROM Bags WHERE title = ?', [bag.title]);
    return res;
  }

  /// Method to delete all the user information from the Database using rawDelete
  Future<int> deleteAllUsers() async {
    var dbClient = await db;
    int res = await dbClient.rawDelete('DELETE FROM Bags');
    return res;
  }

  /// Method to update the attendees information using update query.
  Future<bool> update(Bags bag) async {
    print(bag.toMap());
    var dbClient = await db;
    int res = await dbClient.update("Bags", bag.toMap(),
        where: "title = ?", whereArgs: <String>[bag.title]);
    print(res);
    return res > 0 ? true : false;
  }
}
