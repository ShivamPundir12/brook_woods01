import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_page/cart_items.dart';
import 'cart_page/cart_provider.dart';

class CartProduct extends StatelessWidget {
  static const id = '/CartScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.blueAccent, title: Text("Cart")),
      body: Column(
        children: [
          Expanded(child: _CartList()),
          Divider(
            thickness: 1,
          ),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Total',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Lobster',
                  fontSize: 22),
            ),
          ),
          Spacer(),
          Card(
              child: Text("\₹${cart.totalToPay}"),
              margin: EdgeInsets.only(right: 14)),
          ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Colors.indigoAccent.shade200,
                    duration: Duration(seconds: 1),
                    behavior: SnackBarBehavior.floating,
                    content: Text(
                      "Purchase feature will be Available Soon!",
                      style: TextStyle(fontWeight: FontWeight.w200),
                    )));
              },
              child: Text(
                "Order Now",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Lobster',
                    fontSize: 18),
              ))
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  @override
  __CartListState createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) => CartItemTile(
              image: cart.items.values.toList()[index].image,
              name: cart.items.values.toList()[index].name,
              price: cart.items.values.toList()[index].price,
              qty: cart.items.values.toList()[index].qty,
            ));
  }
}
