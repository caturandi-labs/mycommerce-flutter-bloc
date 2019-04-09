import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mycommerce/api/db_api.dart';
import 'package:mycommerce/models/category.dart';
import 'package:mycommerce/widgets/bloc_provider.dart';
import 'dart:async';

class CategoriesBloc implements BlocBase{

  List<Category> _categories = new List<Category>();

  //Controller BloC
  StreamController<List<Category>> _categoriesController = StreamController<List<Category>>();

  //Data Stream
  Sink<List<Category>> get _inCategories => _categoriesController.sink;
  Stream<List<Category>> get outCategories => _categoriesController.stream;

  //Constructor
  CategoriesBloc(){
    getCategories();
  }

  void getCategories() {
    DbApi dbApi = DbApi();
    dbApi.getCategories().listen((snapshot){
      List<Category> tempCategories = List();
      for(DocumentSnapshot doc in snapshot.documents) {
        Category category = Category.fromFirebase(doc.data);
        category.id = doc.documentID;
        tempCategories.add(category);
      }
      _categories.clear();
      _categories.addAll(tempCategories);
      _inCategories.add(_categories);
    });
  }

  @override
  void dispose() {
    _categoriesController.close();
  }

}