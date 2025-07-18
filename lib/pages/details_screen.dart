import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/pages/cart_details.dart';
import 'package:e_commerce_app/providers/cart_provider.dart';
import 'package:e_commerce_app/widgets/available_size.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Details",), 
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 36),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red.shade100,
                ),
                child: Image.asset(product.image,fit: BoxFit.cover,),
              ),
            ],
          ),
          const SizedBox(height: 36),
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 240, 210, 220),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$'
                      '${product.price}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  product.description,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 14),
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Available Size",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    AvailableSize(size: "US 6"),
                    AvailableSize(size: "US 7"),
                    AvailableSize(size: "US 8"),
                    AvailableSize(size: "US 9"),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Available Colors",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    CircleAvatar(radius: 16, backgroundColor: Colors.blue),
                    SizedBox(width: 8.0),
                    CircleAvatar(radius: 16, backgroundColor: Colors.red),
                    SizedBox(width: 8.0),
                    CircleAvatar(radius: 16, backgroundColor: Colors.amber),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 10,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 0, 0),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$' '${product.price}',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  provider.toggleProduct(product);
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => const CartDetails(), 
                    ),
                  );
                }, 
                icon: const Icon(Icons.send),
                label: const Text("Add to Cart"),
              ),
            ],
          ),
        ),
    );
  }
}
