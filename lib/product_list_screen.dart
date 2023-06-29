import 'package:estore/product_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:estore/product.dart'; 
import 'package:estore/cart_screen.dart';


class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      'The Great Gatsby',
      "third novel by F. Scott Fitzgerald, published in 1925 by Charles Scribner's Sons. Set in Jazz Age New York",
      10,
      'https://upload.wikimedia.org/wikipedia/commons/7/7a/The_Great_Gatsby_Cover_1925_Retouched.jpg',
    ),
    Product(
      'The Adventures of Huckleberry Finn',
      'The story follows young Huckleberry “Huck” Finn after he fakes his death to escape his abusive father and runs away with a slave called Jim',
      29,
      'https://kbimages1-a.akamaihd.net/672378fc-47c4-421b-96dd-f36b82572030/1200/1200/False/adventures-of-huckleberry-finn-125.jpg',
    ),
        Product(
      'To Kill a Mockingbird',
      'As a Southern Gothic novel and a Bildungsroman, the primary themes of To Kill a Mockingbird involve racial injustice and the destruction of innocence.',
      15,
      'https://upload.wikimedia.org/wikipedia/commons/4/4f/To_Kill_a_Mockingbird_%28first_edition_cover%29.jpg',
    ),
        Product(
      'Jane Eyre',
      'a first-person narrative of the title character, a small, plain-faced, intelligent and honest English orphan.',
      24,
      'https://kbimages1-a.akamaihd.net/da784a8c-ccd0-4abe-b538-a8f11b6ccf14/1200/1200/False/jane-eyre-annotated.jpg',
    ),
        Product(
      'One Hundred Years of Solitude',
      '1967 novel by Colombian author Gabriel García Márquez that tells the multi-generational story of the Buendía family',
      18,
      'https://m.media-amazon.com/images/I/81MI6+TpYkL._AC_UF1000,1000_QL80_.jpg',
    ),
        Product(
      'The Catcher in the Rye',
      'a 1945 novel by J. D. Salinger. Originally published for adults, the novel has become a common part of high school and college',
      19,
      'https://upload.wikimedia.org/wikipedia/commons/8/89/The_Catcher_in_the_Rye_%281951%2C_first_edition_cover%29.jpg',
    ),
        Product(
      'Don Quixote',
      'Image of Don Quixote. Alonso Quixano, a retired country gentleman in his fifties, lives in an unnamed section of La Mancha with his niece and a housekeeper',
      29,
      'https://cdn.kobo.com/book-images/4834736b-7eb8-47eb-bf33-f2dc2ef06065/1200/1200/False/don-quixote-best-navigation-free-audio-book-a-to-z-classics.jpg',
    ),
        Product(
      'The Grapes of Wrath',
      'Image of The Grapes of Wrath. Set during the Great Depression, the novel focuses on a poor family of sharecroppers, the Joads, driven from their home',
      14,
      'https://www.arts.gov/sites/default/files/Grapes%20of%20Wrath.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: GridView.builder(
          padding: EdgeInsets.all(10),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductOverviewScreen(product),
                  ),
                );
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image.network(
                        product.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Price: \$${product.price}',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// class CartScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Cart screen implementation
//     // ...
//     return Container(); // Replace with your cart screen UI
//   }
// }
