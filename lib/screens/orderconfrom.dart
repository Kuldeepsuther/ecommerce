import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcart/provider/functionality.dart';
import 'package:shoppingcart/screens/homescreen.dart';
import 'package:shoppingcart/screens/orderdetails.dart';

class OrderDone extends StatelessWidget {
  const OrderDone({super.key});

  @override
  Widget build(BuildContext context) {
    final addToCart = Provider.of<AddToCart>(context);
    final selected = addToCart.selectedItems;
    return Scaffold(
      appBar: AppBar(
        title: Text("Conformation"),
      ),
      body: Container(
        color: Colors.black12,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Order Confromed",
              style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () {},
              child: Icon(Icons.done_all),
            )
          ],
        ),
      ),
    );
  }
}
