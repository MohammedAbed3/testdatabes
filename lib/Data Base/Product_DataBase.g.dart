// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Product_DataBase.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorProduct_DataBase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$Product_DataBaseBuilder databaseBuilder(String name) =>
      _$Product_DataBaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$Product_DataBaseBuilder inMemoryDatabaseBuilder() =>
      _$Product_DataBaseBuilder(null);
}

class _$Product_DataBaseBuilder {
  _$Product_DataBaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$Product_DataBaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$Product_DataBaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<Product_DataBase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$Product_DataBase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$Product_DataBase extends Product_DataBase {
  _$Product_DataBase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  Product_Dao? _product_daoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Product_Model` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `Product_Name` TEXT, `Product_Year` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  Product_Dao get product_dao {
    return _product_daoInstance ??= _$Product_Dao(database, changeListener);
  }
}

class _$Product_Dao extends Product_Dao {
  _$Product_Dao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _product_ModelInsertionAdapter = InsertionAdapter(
            database,
            'Product_Model',
            (Product_Model item) => <String, Object?>{
                  'id': item.id,
                  'Product_Name': item.Product_Name,
                  'Product_Year': item.Product_Year
                },
            changeListener),
        _product_ModelUpdateAdapter = UpdateAdapter(
            database,
            'Product_Model',
            ['id'],
            (Product_Model item) => <String, Object?>{
                  'id': item.id,
                  'Product_Name': item.Product_Name,
                  'Product_Year': item.Product_Year
                },
            changeListener),
        _product_ModelDeletionAdapter = DeletionAdapter(
            database,
            'Product_Model',
            ['id'],
            (Product_Model item) => <String, Object?>{
                  'id': item.id,
                  'Product_Name': item.Product_Name,
                  'Product_Year': item.Product_Year
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Product_Model> _product_ModelInsertionAdapter;

  final UpdateAdapter<Product_Model> _product_ModelUpdateAdapter;

  final DeletionAdapter<Product_Model> _product_ModelDeletionAdapter;

  @override
  Stream<List<Product_Model>> getAllProduct() {
    return _queryAdapter.queryListStream('SELECT * FROM Product_Model',
        mapper: (Map<String, Object?> row) => Product_Model(
            id: row['id'] as int?,
            Product_Name: row['Product_Name'] as String?,
            Product_Year: row['Product_Year'] as String?),
        queryableName: 'Product_Model',
        isView: false);
  }

  @override
  Future<int> insertProduct(Product_Model product_model) {
    return _product_ModelInsertionAdapter.insertAndReturnId(
        product_model, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateProduct(Product_Model product_model) {
    return _product_ModelUpdateAdapter.updateAndReturnChangedRows(
        product_model, OnConflictStrategy.abort);
  }

  @override
  Future<int> DeleteProduct(Product_Model product_model) {
    return _product_ModelDeletionAdapter
        .deleteAndReturnChangedRows(product_model);
  }
}
