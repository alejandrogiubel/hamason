import 'package:json_annotation/json_annotation.dart';
part 'basic_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BasicResponse<T> {
  BasicResponse({
    required this.products,
    required this.skip,
    required this.limit,
    required this.total,
  });

  final T products;
  final int limit;
  final int skip;
  final int total;

  factory BasicResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BasicResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(
    Object? Function(T value) toJsonT,
  ) =>
      _$BasicResponseToJson(this, toJsonT);
}
