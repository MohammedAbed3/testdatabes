
import 'package:floor/floor.dart';
import 'package:testdatabes/Data%20Base/Product_Model.dart';

@dao
abstract class Product_Dao{

  @insert
  Future<int> insertProduct(Product_Model product_model);

  @update
  Future<int> updateProduct(Product_Model product_model);
  
  @delete
  Future<int> DeleteProduct(Product_Model product_model);
  
  @Query('SELECT * FROM Product_Model')
  Stream<List<Product_Model>> getAllProduct();

}