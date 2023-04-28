import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testdatabes/Data%20Base/Product_Dao.dart';
import 'package:testdatabes/Data%20Base/Product_DataBase.dart';
import 'package:testdatabes/Data%20Base/Product_Model.dart';

class First_Scareen extends StatefulWidget {
  @override
  State<First_Scareen> createState() => _First_ScareenState();
}

class _First_ScareenState extends State<First_Scareen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data();
  }

  Product_Dao? product_dao;
  Future<void> data() async {
    final database =
        await $FloorProduct_DataBase.databaseBuilder('mydatabes.db').build();
    product_dao = database.product_dao;
  }

  var co = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextFormField(
            controller:co ,
          ),
          Row(
            children: [
              MaterialButton(
                onPressed: () {
                  product_dao!.insertProduct(
                      Product_Model(Product_Name: '${co.text}', Product_Year: '2005'));
                },
                child: Text('Add'),
              ),
              MaterialButton(
                onPressed: () {
                  product_dao!.DeleteProduct(Product_Model(id: 3));
                },
                child: Text('Delete'),
              ),
              MaterialButton(
                onPressed: () {
                  product_dao!.updateProduct(Product_Model(id: 5,Product_Name: 'mohamed'));
                },
                child: Text('Update'),
              ),
            ],
          ),

          StreamBuilder<List<Product_Model>>(
            stream: product_dao?.getAllProduct(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final products = snapshot.data!;
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ListTile(
                        title: Text(product.Product_Name.toString()),
                        subtitle: Text(product.Product_Year.toString()),
                      );
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),


        ],
      ),
    );
  }
}
