import 'package:flutter/material.dart';
import 'package:hamason/app/app.bottomsheets.dart';
import 'package:hamason/app/app.dialogs.dart';
import 'package:hamason/app/app.locator.dart';
import 'package:hamason/app/app.router.dart';
import 'package:hamason/ui/common/theme.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  setupDialogUi();
  setupBottomSheetUi();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hamason',
      theme: appTheme,
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
