
import 'package:mycommerce/blocs/cart_bloc.dart';
import 'package:mycommerce/models/Product.dart';
import 'package:mycommerce/widgets/bloc_provider.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _cartBloc = BlocProvider.of<CartBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: StreamBuilder<List<Product>>(
        stream: _cartBloc.outProducts,
        initialData: [],
        builder: (context, snapshot) {
          if(snapshot.data.isNotEmpty){
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data[index].name),
                  trailing: Text(snapshot.data[index].amount.toString()),
                );
              },
            );
          }else {
            return Center(
              child: Text('No Item in The Cart'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          
        },
        child: Icon(Icons.arrow_forward),
        backgroundColor: Colors.blue,
      ),
    );
  }
}