import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'pagination_list_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PaginationListModel<T extends INetworkModel> extends INetworkModel {
  List<T>? sources;
  String? status;
  T? parseModel;

  PaginationListModel({
    this.sources,
    this.status,
    this.parseModel,
  });

  T fromJsonT(Object? json) {
    return parseModel?.fromJson(json as Map<String, dynamic>);
  }

  Object? toJsonT(T data) {
    return data.toJson();
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$PaginationListModelFromJson(json, fromJsonT);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$PaginationListModelToJson(this, toJsonT);
  }
}
