import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import '../../utils/typedefs.dart';

part 'paginated_list_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PaginatedListResponse<T extends INetworkModel> extends INetworkModel {
  PaginatedListResponse({
    this.parseModel,
    this.status,
    this.totalResults,
    this.articles,
  });

  T? parseModel;
  String? status;
  int? totalResults;
  List<T>? articles;

  T fromJsonT(Object? json) {
    return parseModel?.fromJson(json as JsonMap);
  }

  Object? toJsonT(T data) {
    return data.toJson();
  }

  @override
  fromJson(JsonMap json) {
    return _$PaginatedListResponseFromJson(json, fromJsonT);
  }

  @override
  JsonMap toJson() {
    return _$PaginatedListResponseToJson(this, toJsonT);
  }
}
