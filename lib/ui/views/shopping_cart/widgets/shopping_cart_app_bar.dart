import 'package:flutter/material.dart';
import 'package:hamason/core/gen/assets.gen.dart';
import 'package:hamason/ui/common/app_colors.dart';
import 'package:hamason/ui/views/shopping_cart/shopping_cart_viewmodel.dart';
import 'package:hamason/ui/widgets/primary_circular_button.dart';

class ShoppingCartAppBar extends StatelessWidget with PreferredSizeWidget {
  const ShoppingCartAppBar({
    super.key,
    required this.viewModel,
    this.onDeleted,
  });
  final ShoppingCartViewModel viewModel;
  final Function()? onDeleted;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 50,
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: PrimaryCircularWhiteButton(
          onPressed: () => viewModel.navigateToHomeView(),
          icon: Assets.backArrow.svg(),
        ),
      ),
      title: Column(
        children: [
          const Text(
            'Carrito',
            style: TextStyle(
              color: kcDarkGreyColor,
            ),
          ),
          Text(
            '${viewModel.cartCount()} productos',
            style: const TextStyle(
              color: kcDarkGreyColor,
              fontSize: 13,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: PrimaryCircularWhiteButton(
            onPressed: () => viewModel.clearShoppingCart(),
            icon: Assets.trash.svg(),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
