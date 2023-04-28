import 'package:hamason/app/app.locator.dart';
import 'package:hamason/models/shopping_cart_product.dart';
import 'package:hamason/services/shopping_cart_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ShoppingCartViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _shoppingCartService = locator<ShoppingCartService>();

  void addToCart(ShoppingCartProduct product) {
    _shoppingCartService.addProductToShoppingCart(product.product);
    rebuildUi();
  }

  void removeFromCart(ShoppingCartProduct product) {
    _shoppingCartService.removeProductFromShoppingCart(product);
    rebuildUi();
  }

  void navigateToHomeView() {
    _navigationService.back();
  }

  void clearShoppingCart() {
    _shoppingCartService.clearShoppingCart();
    rebuildUi();
  }

  String cartCount() {
    return _shoppingCartService.shoppingCart.isNotEmpty
        ? _shoppingCartService.shoppingCart
            .map((e) => e.quatity)
            .reduce((value, element) => value + element)
            .toString()
        : '0';
  }

  int get totalPrice {
    return _shoppingCartService.shoppingCart.fold(
      0,
      (previousValue, element) =>
          previousValue + element.product.price * element.quatity,
    );
  }

  List<ShoppingCartProduct> get shoppingCart =>
      _shoppingCartService.shoppingCart;
}
