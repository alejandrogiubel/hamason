// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasicResponse<T> _$BasicResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BasicResponse<T>(
      products: fromJsonT(json['products']),
      skip: json['skip'] as int,
      limit: json['limit'] as int,
      total: json['total'] as int,
    );

Map<String, dynamic> _$BasicResponseToJson<T>(
  BasicResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'products': toJsonT(instance.products),
      'limit': instance.limit,
      'skip': instance.skip,
      'total': instance.total,
    };
