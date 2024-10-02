import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcart/provider/functionality.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    final addToCart = Provider.of<AddToCart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("My Orders"),
      ),
      body: ListView.builder(
          itemCount: addToCart.allOrders.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("item ${addToCart.allOrders[index].name}"),
            );
          }),
    );
  }
}
