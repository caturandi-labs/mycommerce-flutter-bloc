import 'package:mycommerce/blocs/categories_bloc.dart';
import 'package:mycommerce/blocs/products_bloc.dart';
import 'package:mycommerce/models/category.dart';
import 'package:mycommerce/pages/selected_category.dart';
import 'package:mycommerce/widgets/bloc_provider.dart';
import 'package:mycommerce/widgets/cart_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CategoriesBloc _categoriesBloc =
        BlocProvider.of<CategoriesBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Demo Aplikasi Bloc'),
          actions: <Widget>[
            CartButton(),
          ],
        ),
        body: StreamBuilder(
          stream: _categoriesBloc.outCategories,
          builder: (context, categories) {
            if (categories.hasData) {
              return ListView.builder(
                itemCount: categories.data.length,
                itemBuilder: (BuildContext context, int index) {
                  final category = categories.data[index];
                  return ListTile(
                    onTap: () {
                      navigateToSelectedCategory(context, category);
                    },
                    title: Text(
                      category.name,
                      style: TextStyle(fontSize: 24.0),
                    ),
                    subtitle: Text(
                      category.caption
                    ),
                    leading: Icon(FontAwesomeIcons.box, size: 30.0,),
                  );
                },
              );
            }

            return LinearProgressIndicator();
          },
        ),
        );
  }

  void navigateToSelectedCategory(BuildContext context, Category category) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => BlocProvider<ProductsBloc>(
      bloc: ProductsBloc(category),
      child: SelectedCategoryPage(),
    )));
  }

} 
