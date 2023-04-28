import 'package:flutter_test/flutter_test.dart';
import 'package:hamason/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ShoppingCartServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
