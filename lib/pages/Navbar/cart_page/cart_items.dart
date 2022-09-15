import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cart_provider.dart';

class CartItemTile extends StatefulWidget {
  const CartItemTile(
      {Key? key,
      required this.image,
      required this.name,
      required this.price,
      required this.qty})
      : super(key: key);

  final List image;
  final String name;
  final String price;
  final int qty;

  @override
  State<CartItemTile> createState() => _CartItemTileState();
}

class _CartItemTileState extends State<CartItemTile> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              child: Image.asset(
                widget.image[0],
                alignment: Alignment(-3, 0),
              ),
            ),
            Container(
              width: 150,
              child: Column(
                children: [
                  Text(widget.name.toString()),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "₹${widget.price.toString()}",
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "x${widget.qty.toString()}",
                    textAlign: TextAlign.end,
                  ),
                  SizedBox(
                    width: 10,
                    height: 8,
                  ),
                  IconButton(
                      icon: Icon(CupertinoIcons.trash_fill),
                      onPressed: () {
                        Provider.of<Cart>(context, listen: false)
                            .removeItem(widget.name);
                      }),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 27),
                    child: Row(
                      children: [
                        IconButton(
                            icon: Icon(CupertinoIcons.add_circled),
                            onPressed: () {
                              setState(() {
                                if (widget.qty <= 19) {
                                  cart.addItem(
                                    image: widget.image.toList(),
                                    name: widget.name.toString(),
                                    price: widget.price.toString(),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          backgroundColor:
                                              Colors.indigoAccent.shade200,
                                          duration: Duration(seconds: 1),
                                          behavior: SnackBarBehavior.floating,
                                          content: Text(
                                            "Cann't add more Item",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w200),
                                          )));
                                }
                              });
                            }),
                        IconButton(
                            icon: Icon(CupertinoIcons.minus_circle),
                            onPressed: () {
                              setState(() {
                                if (widget.qty != 1) {
                                  cart.remove(
                                    image: widget.image.toList(),
                                    name: widget.name.toString(),
                                    price: widget.price.toString(),
                                  );
                                }
                              });
                            })
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
