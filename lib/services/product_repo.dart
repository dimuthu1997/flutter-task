import 'package:task/models/product_model.dart';
import 'package:task/services/api_service.dart';

class ProductRepository {
  final ApiService _apiService;

  ProductRepository(this._apiService);

  Future<ProductsResponse?> getProducts() async {
    return await _apiService.fetchProducts();
  }
}
