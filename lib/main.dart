import 'package:flutter/material.dart';
import 'package:mycommerce/blocs/cart_bloc.dart';
import 'package:mycommerce/blocs/categories_bloc.dart';
import 'package:mycommerce/pages/home_page.dart';
import 'package:mycommerce/widgets/bloc_provider.dart';

void main() {
  runApp(BlocProvider<CartBloc>(
    child: MyApp(),
    bloc: CartBloc(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var blocProvider = BlocProvider<CategoriesBloc>(
      bloc: CategoriesBloc(),
      child: HomePage(),
    );
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Demo Bloc",
        theme: ThemeData(
          primaryTextTheme: TextTheme(title: TextStyle(color: Colors.white))
        ),
        home: blocProvider);
  }
}
