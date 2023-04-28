import 'package:hamason/app/app.locator.dart';
import 'package:hamason/app/app.router.dart';
import 'package:hamason/models/product.dart';
import 'package:hamason/services/products_service.dart';
import 'package:hamason/services/shopping_cart_service.dart';
import 'package:hamason/ui/views/home/home_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends FormViewModel {
  PagingController<int, Product> controller = PagingController(firstPageKey: 0);

  final _navigationService = locator<NavigationService>();
  final int _pageSize = 20;
  final _productsService = locator<ProductsService>();
  final _shoppingCartService = locator<ShoppingCartService>();
  final prodcutsCategories = <String>[];

  Future<void> fetchProducts(int pageKey) async {
    try {
      final newItems = await _productsService.getProducts(
        limit: _pageSize,
        skip: _pageSize * pageKey,
      );
      final isLastPage = newItems.products.length < _pageSize;
      if (isLastPage) {
        controller.appendLastPage(newItems.products);
      } else {
        controller.appendPage(newItems.products, pageKey + 1);
      }
    } catch (error) {
      controller.error = error;
    }
  }

  Future<void> searchProducts(int pageKey) async {
    final query = hasQueryInput ? queryInputValue! : '';
    try {
      final newItems = await _productsService.searchProducts(
        limit: _pageSize,
        skip: _pageSize * pageKey,
        query: query,
      );
      final isLastPage = newItems.products.length < _pageSize;
      if (isLastPage) {
        controller.appendLastPage(newItems.products);
      } else {
        controller.appendPage(newItems.products, pageKey + 1);
      }
    } catch (error) {
      controller.error = error;
    }
  }

  Future<void> fetchProductsCategories() async {
    prodcutsCategories
        .addAll(await _productsService.productsCategories(limit: 100, skip: 0));
    rebuildUi();
  }

  void resertController() {
    controller.refresh();
  }

  void addProductToShoppingCart(Product product) {
    _shoppingCartService.addProductToShoppingCart(product);
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

  bool cartIsNotEmpty() {
    return _shoppingCartService.shoppingCart.isNotEmpty;
  }

  void navigateToShoppingCartView() {
    _navigationService
        .navigateToShoppingCartView()
        .then((value) => rebuildUi());
  }

  void navigateToProductDetailsView(Product product) {
    _navigationService
        .navigateToProductDetailsView(product: product)
        .then((value) => rebuildUi());
  }

}
