import 'package:hamason/models/product.dart';
import 'package:hamason/models/shopping_cart_product.dart';

class ShoppingCartService {
  final List<ShoppingCartProduct> _shoppingCartProducts = [];

  void addProductToShoppingCart(Product product) {
    final existingProduct = _shoppingCartProducts.firstWhere(
      (element) => element.product == product,
      orElse: () => ShoppingCartProduct(
        product: product,
        quatity: 0,
      ),
    );
    final updatedProduct = existingProduct.copyWith(
      quatity: existingProduct.quatity + 1,
    );
    final index = _shoppingCartProducts.indexOf(existingProduct);
    if (index == -1) {
      _shoppingCartProducts.add(updatedProduct);
    } else {
      _shoppingCartProducts.remove(existingProduct);
      _shoppingCartProducts.insert(index, updatedProduct);
    }
  }

  int suma() {
    return 2;
  }

  void removeProductFromShoppingCart(ShoppingCartProduct product) {
    final existingProduct = _shoppingCartProducts.firstWhere(
      (element) => element.product == product.product,
    );
    final updatedProduct = existingProduct.copyWith(
      quatity: existingProduct.quatity - 1,
    );
    if (updatedProduct.quatity == 0) {
      _shoppingCartProducts.remove(existingProduct);
    } else {
      final index = _shoppingCartProducts.indexOf(existingProduct);
      if (index == -1) {
        _shoppingCartProducts.add(updatedProduct);
      } else {
        _shoppingCartProducts.remove(existingProduct);
        _shoppingCartProducts.insert(index, updatedProduct);
      }
    }
  }

  void clearShoppingCart() {
    _shoppingCartProducts.clear();
  }

  List<ShoppingCartProduct> get shoppingCart => _shoppingCartProducts;
}
