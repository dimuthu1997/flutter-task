import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:task/models/product_model.dart';
import 'package:task/services/api_service.dart';

class ProductController extends GetxController {
  final ApiService _apiService;
  var productList = <Product>[].obs;
  var isLoading = true.obs;
  final Logger _logger = Logger();

  ProductController(this._apiService);

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  // Fetch products using ApiService
  void fetchProducts() async {
    isLoading(true);
    try {
      var productsResponse = await _apiService.fetchProducts();
      if (productsResponse != null && productsResponse.products != null) {
        productList.assignAll(productsResponse.products!);
      } else {
        productList.clear();
      }
    } catch (e) {
      _logger.e("Error fetching products: $e");
    } finally {
      isLoading(false);
    }
  }
}
