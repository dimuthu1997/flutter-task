import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controllers/product_controller.dart';
import 'package:task/controllers/signin_controller.dart';
import 'package:task/controllers/theme_controller.dart';
import 'package:task/services/api_service.dart';
import 'package:task/services/dio_client.dart';
import 'package:task/views/login_view.dart';

class ProductsApp extends StatefulWidget {
  const ProductsApp({super.key});

  @override
  State<ProductsApp> createState() => _ProductsAppState();
}

class _ProductsAppState extends State<ProductsApp> {
  @override
  void initState() {
    super.initState();
    _initServices();
  }

  void _initServices() {
    Get.put<SignInController>(SignInController(), permanent: true);
    Get.put<ThemeController>(ThemeController(), permanent: true);
    Get.put<ApiService>(ApiService(DioClient()), permanent: true);
    Get.put<ProductController>(
      ProductController(Get.find<ApiService>()),
      permanent: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Products',
      themeMode: ThemeMode.light,
      theme: themeController.theme,
      home: LoginView(),
    );
  }
}
