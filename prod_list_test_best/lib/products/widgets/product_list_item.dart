import 'package:flutter/material.dart';

import '../models/product.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      "FROM",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7.0),
                      child: Text(
                        "\$" + product.price.toString(),
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(10),
                        primary: Colors.black87, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      child: const Icon(
                        Icons.add_shopping_cart,
                        size: 25,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
                Image.network(product.image ?? '', height: 340, width: 240),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(2.0, 12.0, 2.0, 0.0),
              child: Row(
                children: <Widget>[
                  /// Product category
                  Container(
                    child: Text(
                      product.category ?? '',
                      style: const TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),

                  /// Ratig rate
                  Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(6),
                        primary: Colors.black87, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      child: Text(
                        product.rating?.rate.toString() ?? '',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      onPressed: () {},
                    ),
                  ),

                  /// Ratig count
                  Container(
                    padding: EdgeInsets.all(3),
                    width: 30.0,
                    height: 20.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      product.rating?.count.toString() ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),

            /// Product title
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      product.title ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        letterSpacing: 0.5,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),

            /// Product description
            Text(
              product.description ?? '',
              style: const TextStyle(
                fontSize: 13,
              ),
              textAlign: TextAlign.left,
            ),
            const Divider(
              color: Colors.black,
              indent: 1,
              endIndent: 1,
            ),
          ],
        ),
      ),
    );
  }
}
