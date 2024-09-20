import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task/utils/constants/assets.dart';

class ProductImageWidget extends StatelessWidget {
  final String? imageUrl;

  const ProductImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: imageUrl == null || imageUrl!.isEmpty
          ? Image.asset(AppAssets.noImage, width: 50, height: 50)
          : Image.network(
              imageUrl!,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.white,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(AppAssets.noImage, width: 50, height: 50);
              },
            ),
    );
  }
}
