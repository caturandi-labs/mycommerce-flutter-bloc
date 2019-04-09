import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mycommerce/models/category.dart';
import 'dart:async';

class DbApi {
  // List<Category> getCategories(){
  //   List<Category> tempList = [
  //     Category('iPhone'), Category('Xiaomi'), Category('Samsung'),
  //     Category('Mito'), Category('Realme'), Category('Oppo'),
  //   ];
  //   return tempList;
  // }

  Stream<QuerySnapshot> getCategories() {
    Firestore db = Firestore.instance;
    try{
      Stream<QuerySnapshot> querySnapshot = db.collection('Categories').snapshots();
      print(querySnapshot);
      return querySnapshot;
    }catch(e) {
      print(e);
    }
  }

  Stream<QuerySnapshot> getProducts(Category category) {
    Firestore db = Firestore.instance;
    try{
      Stream<QuerySnapshot> querySnapshot = db.collection('Categories').document(category.id).collection('tops').snapshots();
      print(querySnapshot);
      return querySnapshot;
    }catch(e) {
      print(e);
    }
  }

  /*List<Product> getProducts(Category category) {
    List<Product> tempList = [
      Product.create('Product 1'),
      Product.create('Product 2'),
      Product.create('Product 3'),
      Product.create('Product 4'), 
    ];
    return tempList;
  }*/


}