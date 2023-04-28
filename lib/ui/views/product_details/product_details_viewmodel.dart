import 'package:hamason/app/app.locator.dart';
import 'package:hamason/models/product.dart';
import 'package:hamason/services/shopping_cart_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductDetailsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _shoppingCartService = locator<ShoppingCartService>();

  void addProductToShoppingCart(Product product) {
    _shoppingCartService.addProductToShoppingCart(product);
  }

  void navigateBack() {
    _navigationService.back();
  }
}
