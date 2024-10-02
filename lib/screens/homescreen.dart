import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcart/provider/functionality.dart';
import 'package:shoppingcart/screens/cart.dart';
import 'package:shoppingcart/screens/myorders.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final addToCart = Provider.of<AddToCart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Shopping"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30, top: 10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyCart()));
              },
              child: Stack(children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10, top: 5),
                  child: Icon(
                    Icons.shopping_cart,
                    size: 30,
                  ),
                ),
                Positioned(
                  top: -8,
                  right: 0,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.transparent,
                    child: Text(
                      addToCart.selectedItems.length.toString(),
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ]),
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  "https://images.pexels.com/photos/1933873/pexels-photo-1933873.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                "My Account",
                style: TextStyle(fontSize: 25),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyOrder()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 17),
                child: Text(
                  "My Orders",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ]),
        ),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              crossAxisSpacing: 10, // Spacing between columns
              mainAxisSpacing: 10, // Spacing between rows
              childAspectRatio: 0.8),
          itemCount: addToCart.items.length,
          itemBuilder: (context, index) {
            final item = addToCart.items[index];
            return Stack(
              children: [
                Positioned(
                  left: 0,
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 260,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Container(
                    height: 140,
                    width: 190,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(item.imageUrl),
                            fit: BoxFit.cover),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 160, left: 20),
                  child: Text(
                    item.name,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 192, left: 20),
                  child: Row(
                    children: [
                      Text(
                        "${item.rating} ★",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Text(
                        "\$${item.pricing}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    addToCart.addItem(addToCart.items[index]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 220, left: 18),
                    child: Container(
                      width: 175,
                      height: 33,
                      alignment: Alignment.center,
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.red,
                      ),
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
