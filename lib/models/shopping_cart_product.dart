import 'package:equatable/equatable.dart';
import 'package:hamason/models/product.dart';

class ShoppingCartProduct extends Equatable {
  final Product product;
  final int quatity;

  const ShoppingCartProduct({
    required this.product,
    required this.quatity,
  });

  ShoppingCartProduct copyWith({
    Product? product,
    int? quatity,
  }) {
    return ShoppingCartProduct(
      product: product ?? this.product,
      quatity: quatity ?? this.quatity,
    );
  }

  int get totalPrice => product.price * quatity;

  @override
  List<Object?> get props => [product];
}
