import 'package:mycommerce/blocs/cart_bloc.dart';
import 'package:mycommerce/pages/cart_page.dart';
import 'package:mycommerce/widgets/bloc_provider.dart';
import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final _cartBloc = BlocProvider.of<CartBloc>(context);
    return Stack(
      children: <Widget>[
        IconButton(
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context){
                return CartPage();
              })
            );
          },
          icon: Icon(Icons.shopping_cart),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.red,
            child: StreamBuilder<int>(
              stream: _cartBloc.outCount,
              initialData: 0,
              builder: (context, snapshot) {
                return Text(
                  snapshot.data.toString(),
                  style: TextStyle(fontSize: 12.0),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}