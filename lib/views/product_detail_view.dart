import 'package:flutter/material.dart';
import 'package:task/Widgets/carousel_image_widget.dart';
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
            const SizedBox(height: 20),
            CarouselImageWidget(images: product.images ?? []),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price: \$${product.price?.toStringAsFixed(2) ?? 'N/A'}',
                      style: const TextStyle(fontSize: 20)),
                  Text('Rating: ${product.rating ?? 'N/A'}',
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
