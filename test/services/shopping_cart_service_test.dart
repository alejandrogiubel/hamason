import 'package:flutter_test/flutter_test.dart';
import 'package:hamason/app/app.locator.dart';
import 'package:hamason/models/product.dart';
import 'package:hamason/services/shopping_cart_service.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('ShoppingCartServiceTest -', () {
    setUp(() => registerServices());
    final shoppingCartService = ShoppingCartService();
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
    test('Remove product', () {
      shoppingCartService.removeProductFromShoppingCart(
          shoppingCartService.shoppingCart.first);
      expect(shoppingCartService.shoppingCart.isEmpty, true);
    });
    test('Add product again', () {
      shoppingCartService.addProductToShoppingCart(product);
      expect(shoppingCartService.shoppingCart.isEmpty, false);
    });
    test('Clear shopping cart', () {
      shoppingCartService.clearShoppingCart();
      expect(shoppingCartService.shoppingCart.isEmpty, true);
    });
    tearDown(() => locator.reset());
  });
}
