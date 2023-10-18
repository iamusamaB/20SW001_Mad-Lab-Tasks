import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'shop_provider.dart';

class Cardproducts extends StatefulWidget {
  const Cardproducts({super.key});

  @override
  State<Cardproducts> createState() => _CardproductsState();
}

class _CardproductsState extends State<Cardproducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("cart roducts"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: context.watch<ShopProvider>().cartProducts.length,
        itemBuilder: (context, index) {
          final products = context.watch<ShopProvider>().cartProducts[index];
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
                                  context
                                      .read<ShopProvider>()
                                      .removeProducts(index);
                                },
                                child: Row(
                                  children: [
                                    Text("Remove item"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(CupertinoIcons.delete_simple)
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
    );
  }
}
