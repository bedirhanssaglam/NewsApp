// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationListModel<T>
    _$PaginationListModelFromJson<T extends INetworkModel<dynamic>>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
        PaginationListModel<T>(
          sources: (json['sources'] as List<dynamic>?)?.map(fromJsonT).toList(),
          status: json['status'] as String?,
          parseModel: _$nullableGenericFromJson(json['parseModel'], fromJsonT),
        );

Map<String, dynamic>
    _$PaginationListModelToJson<T extends INetworkModel<dynamic>>(
  PaginationListModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
        <String, dynamic>{
          'sources': instance.sources?.map(toJsonT).toList(),
          'status': instance.status,
          'parseModel': _$nullableGenericToJson(instance.parseModel, toJsonT),
        };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
