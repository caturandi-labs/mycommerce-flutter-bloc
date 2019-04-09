import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mycommerce/api/db_api.dart';
import 'package:mycommerce/models/Product.dart';
import 'package:mycommerce/models/category.dart';
import 'package:mycommerce/widgets/bloc_provider.dart';
import 'dart:async';

class ProductsBloc implements BlocBase{

  List<Product> _products = new List<Product>();
  StreamController<List<Product>> _productsController = StreamController<List<Product>>();

  Sink<List<Product>> get _inProducts => _productsController.sink;
  Stream<List<Product>> get outProducts => _productsController.stream;

  ProductsBloc(Category category) {
    getProducts(category);
  }

  void getProducts(Category category) {
    DbApi dbApi = DbApi();
    dbApi.getProducts(category).listen((snapshot){
      List<Product> tempProducts = List();
      for(DocumentSnapshot doc in snapshot.documents) {
        Product product = Product.fromFirestore(doc.data);
        product.id = doc.documentID;
        tempProducts.add(product);
      }
      _products.clear();
      _products.addAll(tempProducts);
      _inProducts.add(_products);
    });
  }

  @override
  void dispose() {
    _productsController.close();
  }

}