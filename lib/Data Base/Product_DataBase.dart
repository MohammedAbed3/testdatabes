

import 'dart:async';

import 'package:floor/floor.dart';
import 'package:testdatabes/Data%20Base/Product_Dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'Product_Model.dart';
part 'Product_DataBase.g.dart'; // the generated code will be there


@Database(version: 1, entities: [Product_Model])
abstract  class Product_DataBase extends FloorDatabase{

  Product_Dao get product_dao;


}