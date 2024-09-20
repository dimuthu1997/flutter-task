import 'package:task/models/product_model.dart';
import 'package:task/services/dio_client.dart';
import 'package:logger/logger.dart';

class ApiService {
  final DioClient _dioClient;
  final Logger _logger = Logger();

  ApiService(this._dioClient);

  Future<ProductsResponse?> fetchProducts() async {
    try {
      final response = await _dioClient.dio.get('/products');
      if (response.statusCode == 200) {
        return ProductsResponse.fromJson(response.data);
      } else {
        _logger.e('Unexpected response status: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      _logger.e('Error fetching products: $e');
      _dioClient.handleError(e);
      return null;
    }
  }
}
