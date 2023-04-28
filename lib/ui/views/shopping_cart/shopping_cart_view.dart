import 'package:flutter/material.dart';
import 'package:hamason/core/gen/assets.gen.dart';
import 'package:hamason/ui/views/shopping_cart/widgets/shopping_cart_app_bar.dart';
import 'package:hamason/ui/views/shopping_cart/widgets/shopping_cart_bottom_sheet.dart';
import 'package:hamason/ui/widgets/primary_circular_button.dart';
import 'package:hamason/ui/widgets/product_list_tile.dart';
import 'package:stacked/stacked.dart';

import 'shopping_cart_viewmodel.dart';

class ShoppingCartView extends StackedView<ShoppingCartViewModel> {
  const ShoppingCartView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ShoppingCartViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: ShoppingCartAppBar(viewModel: viewModel),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(
          thickness: 1,
        ),
        itemCount: viewModel.shoppingCart.length,
        itemBuilder: (context, index) => ProductListTile(
          product: viewModel.shoppingCart[index].product,
          triling: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox.square(
                dimension: 30,
                child: PrimaryCircularButton(
                  icon: Assets.remove.svg(),
                  onPressed: () => viewModel.removeFromCart(
                    viewModel.shoppingCart[index],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(viewModel.shoppingCart[index].quatity.toString()),
              ),
              SizedBox.square(
                dimension: 30,
                child: PrimaryCircularButton(
                  icon: Assets.add.svg(),
                  onPressed: () => viewModel.addToCart(
                    viewModel.shoppingCart[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: ShoppingCartBottomSheet(
        viewModel: viewModel,
      ),
    );
  }

  @override
  ShoppingCartViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ShoppingCartViewModel();
}
