import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task/utils/constants/assets.dart';

class CarouselImageWidget extends StatelessWidget {
  final List<String> images;

  const CarouselImageWidget({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.9,
      ),
      items: images.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        color: Colors.white,
                        width: double.infinity,
                        height: 400,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(AppAssets.noImage, fit: BoxFit.cover);
                  },
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
