import 'package:hamason/models/product.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: 'https://dummyjson.com')
abstract class ApiService {
  factory ApiService() => _ApiService(
        Dio()
          ..interceptors.add(
            PrettyDioLogger(
              requestHeader: true,
              requestBody: true,
              responseBody: true,
              responseHeader: false,
              error: true,
              compact: true,
              maxWidth: 90,
            ),
          ),
      );

  @GET('/products')
  Future<Products?> getProducts({
    @Query('limit') required int limit,
    @Query('skip') required int skip,
  });

  @GET('/products/search')
  Future<Products?> searchProducts({
    @Query('limit') required int limit,
    @Query('skip') required int skip,
    @Query('q') required String query,
  });

  @GET('/products/categories')
  Future<List<String>?> productsCategories({
    @Query('limit') required int limit,
    @Query('skip') required int skip,
  });
}
