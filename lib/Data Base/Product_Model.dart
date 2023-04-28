import 'package:floor/floor.dart';

@entity
class Product_Model {

  @PrimaryKey(autoGenerate: true)
  int? id;
  String? Product_Name;
  String? Product_Year;

  Product_Model({this.id , this.Product_Name, this.Product_Year});
}