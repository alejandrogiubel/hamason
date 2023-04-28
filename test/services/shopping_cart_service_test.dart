import 'package:flutter_test/flutter_test.dart';
import 'package:hamason/app/app.locator.dart';
import 'package:hamason/models/product.dart';
import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';

void main() {
  group('ShoppingCartServiceTest -', () {
    setUp(() => registerServices());
    final shoppingCartService = MockShoppingCartService();
    final product = Product(
      id: 1,
      title: 'Product',
      description: '',
      price: 10,
      discountPercentage: 3,
      rating: 4,
      stock: 4,
      brand: 'brand',
      category: 'category',
      thumbnail: 'thumbnail',
      images: List.empty(),
    );
    test('Add product', () {
      shoppingCartService.addProductToShoppingCart(product);
      expect(shoppingCartService.shoppingCart.isEmpty, false);
    });
    tearDown(() => locator.reset());
  });
}
