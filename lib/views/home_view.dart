import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/utils/constants/assets.dart';
import '../controllers/product_controller.dart';
import '../services/api_service.dart';
import '../services/dio_client.dart';
import '../views/product_detail_view.dart';

class HomeView extends StatelessWidget {
  final ProductController productController;

  HomeView({super.key})
      : productController = Get.put(
          ProductController(ApiService(DioClient())),
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: Obx(() {
        if (productController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (productController.productList.isEmpty) {
          return const Center(child: Text('No products available'));
        } else {
          return ListView.builder(
            itemCount: productController.productList.length,
            itemBuilder: (context, index) {
              var product = productController.productList[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: ListTile(
                  leading: Image.network(
                    product.thumbnail ?? '',
                    width: 50,
                    height: 50,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        AppAssets.noImage,
                        width: 50,
                        height: 50,
                      );
                    },
                  ),
                  title: Text(product.title ?? 'No title available'),
                  subtitle: Text(
                      'Price: \$${product.price?.toStringAsFixed(2) ?? 'N/A'}, '
                      'Brand: ${product.brand ?? 'Unknown'}'),
                  onTap: () =>
                      Get.to(() => ProductDetailView(product: product)),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
