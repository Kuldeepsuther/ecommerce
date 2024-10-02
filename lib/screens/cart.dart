import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcart/screens/homescreen.dart';
import 'package:shoppingcart/screens/orderdetails.dart';
import '../../provider/functionality.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    final addToCart = Provider.of<AddToCart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("MyCart"),
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: addToCart.selectedItems.length,
              itemBuilder: (context, index) {
                final item = addToCart.selectedItems[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: ListTile(
                    minVerticalPadding: 10.0,
                    leading: Container(
                      width: 90,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                            item.imageUrl,
                          )),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                    title: Text(
                      item.name,
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text("${item.rating} ★"),
                    trailing: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              addToCart.addItem(item);
                            },
                            icon: Icon(
                              Icons.add,
                              color: Colors.red,
                              size: 25,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text(
                            "${item.quantity}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              addToCart
                                  .removeItem(addToCart.selectedItems[index]);
                            },
                            icon: Icon(
                              Icons.remove,
                              color: Colors.red,
                              size: 25,
                            ))
                      ],
                    ),
                  ),
                );
              }),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 90,
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Check Out",
                      style: TextStyle(fontSize: 23, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 150),
                    child: Text(
                      "\$${addToCart.totalPrice}",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderDetail()));
                      },
                      icon: Icon(
                        Icons.arrow_circle_right_sharp,
                        color: Colors.white,
                        size: 30,
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
