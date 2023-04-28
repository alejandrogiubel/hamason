import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hamason/core/gen/assets.gen.dart';
import 'package:hamason/models/product.dart';
import 'package:hamason/ui/common/app_colors.dart';
import 'package:hamason/ui/common/ui_helpers.dart';
import 'package:hamason/ui/widgets/primary_circular_button.dart';
import 'package:hamason/ui/widgets/product_image.dart';
import 'package:stacked/stacked.dart';

import 'product_details_viewmodel.dart';

class ProductDetailsView extends StackedView<ProductDetailsViewModel> {
  const ProductDetailsView({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  Widget builder(
    BuildContext context,
    ProductDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: PrimaryCircularWhiteButton(
            onPressed: () => viewModel.navigateBack(),
            icon: Assets.backArrow.svg(),
          ),
        ),
        title: Text(
          product.title,
          style: const TextStyle(
            color: kcDarkGreyColor,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.addProductToShoppingCart(product),
        backgroundColor: kcSubmit,
        child: Assets.shoppingCart.svg(
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 1,
                      autoPlay: true,
                    ),
                    items: product.images.map((i) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: ProductImage(imageUrl: i),
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 15,
                      top: 15,
                    ),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Chip(
                        backgroundColor: kcEnphasys,
                        label: Column(
                          children: [
                            Text(
                              '% ${product.discountPercentage.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              'DESCUENTO',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.category,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      product.brand,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Text(
                      product.description,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    verticalSpace(20),
                    Row(
                      children: [
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: kcEnphasys,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.star_border,
                          color: kcEnphasys,
                        ),
                        Text(
                          product.rating.toString(),
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: kcEnphasys,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  ProductDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductDetailsViewModel();
}
