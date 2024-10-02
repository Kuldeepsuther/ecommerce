import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcart/data/item.dart';
import 'package:shoppingcart/screens/orderconfrom.dart';

import '../provider/functionality.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({super.key});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    final addToCart = Provider.of<AddToCart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Details"),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20),
            child: Text(
              "YOUR ORDER",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90, left: 20),
            child: Text(
              "RECEIPT",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 130, left: 20, right: 20),
            child: Divider(
              color: Colors.black,
              height: 15,
              thickness: 2.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 160, left: 20),
            child: Text("Items ${addToCart.selectedItems.length}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 190, left: 20),
            child: ListView.builder(
                itemCount: addToCart.selectedItems.length,
                itemBuilder: (context, index) {
                  final item = addToCart.selectedItems[index];
                  return ListTile(
                    leading: Container(
                      width: 20,
                      height: 20,
                      child: Text(item.quantity.toString()),
                    ),
                    title: Text(
                      item.name,
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text("${item.rating} ★"),
                    trailing: Text(addToCart.itemPrice.toString()),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 450, left: 20, right: 20),
            child: Divider(
              color: Colors.black,
              height: 15,
              thickness: 2.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 480, left: 60),
            child: Text(
              "Confrom Your Order",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 190,
            left: 40,
            child: Container(
              width: 350,
              height: 90,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "\$${addToCart.totalPrice}",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderDone()));
                      },
                      icon: Icon(
                        Icons.arrow_circle_right_sharp,
                        color: Colors.white,
                        size: 80,
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
