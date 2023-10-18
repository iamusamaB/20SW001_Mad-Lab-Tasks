import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'shop_carts.dart';
import 'shop_model.dart';
import 'shop_provider.dart';
import 'package:provider/provider.dart';

class MyProducts extends StatefulWidget {
  const MyProducts({super.key});

  @override
  State<MyProducts> createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Myproducts"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (() {}), icon: Icon(CupertinoIcons.cart))
        ],
      ),
      body: ListView.builder(
        itemCount: context.watch<ShopProvider>().existingProducts.length,
        itemBuilder: (context, index) {
          final products =
              context.watch<ShopProvider>().existingProducts[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(50)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 70,
                        height: 70,
                        child: CircleAvatar(
                          child: Icon(Icons.shopping_bag),
                        )),
                    Column(
                      children: [
                        Text(
                          "${products.name}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        Text("Quantity : ${products.quantity}"),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${products.price} k"),
                            const Text(
                              " | ",
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                                onPressed: () {
                                  context.read<ShopProvider>().addProducts(
                                      Model(
                                          id: products.id,
                                          name: products.name,
                                          price: products.price,
                                          quantity: products.quantity));
                                },
                                child: Row(
                                  children: [
                                    Text("Add to Cart"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(CupertinoIcons.cart)
                                  ],
                                ))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cardproducts()));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "View Carts",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
