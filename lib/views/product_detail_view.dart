import 'package:flutter/material.dart';
import 'package:task/utils/constants/assets.dart';
import '../models/product_model.dart';

class ProductDetailView extends StatelessWidget {
  final Product product;

  const ProductDetailView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title ?? 'Product Details')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              product.images?.first ?? '',
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(AppAssets.noImage, width: 600, height: 600);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price: \$${product.price}',
                      style: const TextStyle(fontSize: 20)),
                  Text('Rating: ${product.rating}',
                      style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 10),
                  Text(product.description ?? 'No description available'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
