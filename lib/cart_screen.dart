import 'package:flutter/material.dart';
import 'package:estore/shopping_cart.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double _total = 0;

  @override
  void initState() {
    super.initState();
    calculateTotal();
  }

  void calculateTotal() {
    _total = ShoppingCart.products.fold(0, (total, product) => total + product.price);
  }

 void buyAll() {
  setState(() {
    ShoppingCart.clearCart();
    calculateTotal();
  });
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Purchase completed'),
      duration: Duration(seconds: 2),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: ShoppingCart.products.length,
        itemBuilder: (context, index) {
          final product = ShoppingCart.products[index];
          return ListTile(
            leading: Image.network(
              product.image,
              width: 50,
              height: 50,
            ),
            title: Text(product.name),
            subtitle: Text('Price: \$${product.price}'),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: () {
                setState(() {
                  ShoppingCart.removeProduct(product);
                  calculateTotal();
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Removed from cart'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 220,
                child: ElevatedButton(
                  onPressed: buyAll,
                  child: Text('Buy All'),
                ),
              ),
              Text(
                'Total: \$${_total.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
