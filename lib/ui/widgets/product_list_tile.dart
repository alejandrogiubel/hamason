import 'package:flutter/material.dart';
import 'package:hamason/models/product.dart';
import 'package:hamason/ui/common/app_colors.dart';
import 'package:hamason/ui/widgets/product_image.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({
    super.key,
    required this.product,
    required this.triling,
  });
  final Product product;
  final Widget triling;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.title),
      subtitle: Text(
        '\$${product.price.toStringAsFixed(2)}',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: kcPrimaryColorDark,
          fontSize: 18,
        ),
      ),
      leading: ProductImage(imageUrl: product.thumbnail),
      trailing: triling,
    );
  }
}
