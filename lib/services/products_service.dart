import 'package:hamason/app/app.locator.dart';
import 'package:hamason/models/product.dart';
import 'package:hamason/services/api_service.dart';

class ProductsService {
  Future<Products> getProducts({
    required int limit,
    required int skip,
  }) async {
    final apiService = locator<ApiService>();
    final response = await apiService.getProducts(
      limit: limit,
      skip: skip,
    );
    if (response != null) {
      return response;
    }

    throw Exception('Error al obtener los datos');
  }

  Future<Products> searchProducts({
    required int limit,
    required int skip,
    required String query,
  }) async {
    final apiService = locator<ApiService>();
    final response = await apiService.searchProducts(
      limit: limit,
      skip: skip,
      query: query,
    );
    if (response != null) {
      return response;
    }

    throw Exception('Error al obtener los datos');
  }

  Future<List<String>> productsCategories({
    required int limit,
    required int skip,
  }) async {
    final apiService = locator<ApiService>();
    final response = await apiService.productsCategories(
      limit: limit,
      skip: skip,
    );
    if (response != null) {
      return response;
    }

    throw Exception('Error al obtener los datos');
  }
}
