import 'package:flutter/material.dart';
import 'package:hamason/core/gen/assets.gen.dart';
import 'package:hamason/models/product.dart';
import 'package:hamason/ui/views/home/home_viewmodel.dart';
import 'package:hamason/ui/widgets/primary_circular_button.dart';
import 'package:hamason/ui/widgets/product_list_tile.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({
    super.key,
    required this.controller,
    required this.viewModel,
  });
  final PagingController<int, Product> controller;
  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return PagedListView.separated(
      pagingController: controller,
      builderDelegate: PagedChildBuilderDelegate<Product>(
        newPageProgressIndicatorBuilder: (context) =>
            const CircularProgressIndicator.adaptive(),
        firstPageProgressIndicatorBuilder: (context) =>
            const CircularProgressIndicator.adaptive(),
        itemBuilder: (context, item, index) => GestureDetector(
          onTap: () => viewModel.navigateToProductDetailsView(item),
          child: ProductListTile(
            product: item,
            triling: PrimarySquaredButton(
              icon: Assets.shoppingCart.svg(),
              onPressed: () => viewModel.addProductToShoppingCart(item),
            ),
          ),
        ),
      ),
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          thickness: 1,
          height: 30,
        );
      },
    );
  }
}
