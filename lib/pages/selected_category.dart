import 'package:mycommerce/blocs/cart_bloc.dart';
import 'package:mycommerce/blocs/products_bloc.dart';
import 'package:mycommerce/models/Product.dart';
import 'package:mycommerce/widgets/bloc_provider.dart';
import 'package:mycommerce/widgets/cart_button.dart';
import 'package:flutter/material.dart';

class SelectedCategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductsBloc _productsBloc = BlocProvider.of<ProductsBloc>(context);
    final CartBloc _cartBloc = BlocProvider.of<CartBloc>(context);
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Product Categories"),
          actions: <Widget>[
            CartButton(),
          ],
        ),
        body: StreamBuilder<List<Product>>(
          stream: _productsBloc.outProducts,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              default:
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:  2),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext contex, int index) {
                    final product = snapshot.data[index];
                    return Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Image.network(
                            product.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () => _cartBloc.addProduct(product),
                              child: Center(
                                child: Text(
                                  product.name,
                                  style: theme.primaryTextTheme.title,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                );
            }
            return SizedBox();
          },
        ));
  }
}
