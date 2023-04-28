import 'package:flutter_test/flutter_test.dart';
import 'package:hamason/app/app.locator.dart';
import 'package:hamason/models/product.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';

void main() {
  group('ProductsServiceTest -', () {
    setUp(() => registerServices());
    final productsService = MockProductsService();
    test('Get products', () async {
      final products = await productsService.getProducts(limit: 20, skip: 0);
      expect(products, isA<Products>());
    });
    test('Search products', () async {
      final products = await productsService.searchProducts(
          limit: 20, skip: 0, query: 'iphone');
      expect(products, isA<Products>());
    });
    test('Products category', () async {
      final products =
          await productsService.productsCategories(limit: 20, skip: 0);
      expect(products, isA<List<String>>());
    });
    tearDown(() => locator.reset());
  });
}
