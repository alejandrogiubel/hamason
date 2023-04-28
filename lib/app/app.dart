import 'package:hamason/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:hamason/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:hamason/ui/views/home/home_view.dart';
import 'package:hamason/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:hamason/services/products_service.dart';
import 'package:hamason/services/api_service.dart';
import 'package:hamason/ui/views/shopping_cart/shopping_cart_view.dart';
import 'package:hamason/services/shopping_cart_service.dart';
import 'package:hamason/ui/views/product_details/product_details_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: ShoppingCartView),
    MaterialRoute(page: ProductDetailsView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ProductsService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: ShoppingCartService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
