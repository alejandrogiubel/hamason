import 'package:flutter/material.dart';
import 'package:hamason/core/gen/assets.gen.dart';
import 'package:hamason/ui/common/app_colors.dart';
import 'package:hamason/ui/views/home/home_view.form.dart';
import 'package:hamason/ui/widgets/primary_circular_button.dart';
import 'package:hamason/ui/views/home/widgets/bottom_app_bar.dart';
import 'package:hamason/ui/views/home/widgets/home_search.dart';
import 'package:hamason/ui/views/home/widgets/products_list_view.dart';
import 'package:stacked/stacked.dart';
import 'package:hamason/ui/common/ui_helpers.dart';
import 'package:stacked/stacked_annotations.dart';

import 'home_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'queryInput'),
])
class HomeView extends StackedView<HomeViewModel> with $HomeView {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    queryInputController.addListener(() {
      if (queryInputController.text.isNotEmpty) {
        viewModel.resertController();
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: HomeSearch(controller: queryInputController),
        actions: [
          Center(
            child: Badge(
              label: Text(viewModel.cartCount()),
              isLabelVisible: viewModel.cartIsNotEmpty(),
              backgroundColor: kcPrimaryGrey,
              textColor: kcPrimaryColorDark,
              alignment: const AlignmentDirectional(25, -5),
              child: PrimaryCircularButton(
                onPressed: () => viewModel.navigateToShoppingCartView(),
                icon: Assets.shoppingCart.svg(),
              ),
            ),
          ),
          horizontalSpaceMedium,
        ],
        bottom: BottomHomeAppBar(
          productsCategories: viewModel.prodcutsCategories,
        ),
      ),
      body: ProductsListView(
        viewModel: viewModel,
        controller: viewModel.controller
          ..addPageRequestListener(
            (pageKey) {
              queryInputController.text.isEmpty
                  ? viewModel.fetchProducts(pageKey)
                  : viewModel.searchProducts(pageKey);
            },
          ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    viewModel.fetchProductsCategories();
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(HomeViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
