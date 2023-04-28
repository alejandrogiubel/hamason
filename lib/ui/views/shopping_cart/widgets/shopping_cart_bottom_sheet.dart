import 'package:flutter/material.dart';
import 'package:hamason/core/gen/assets.gen.dart';
import 'package:hamason/ui/common/app_colors.dart';
import 'package:hamason/ui/views/shopping_cart/shopping_cart_viewmodel.dart';

class ShoppingCartBottomSheet extends StatelessWidget {
  const ShoppingCartBottomSheet({
    super.key,
    required this.viewModel,
  });
  final ShoppingCartViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(40),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 30, 40, 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Assets.receipt.svg(),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total:',
                        style: TextStyle(
                          color: kcMediumGrey,
                        ),
                      ),
                      Text(
                        '\$${viewModel.totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: kcEnphasys,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: const [
                    Text(
                      'Cupón de descuento',
                      style: TextStyle(
                        color: kcMediumGrey,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: kcMediumGrey,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 180,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Confirmar',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
