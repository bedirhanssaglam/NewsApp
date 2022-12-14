import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/src/core/utils/typedefs.dart';
import 'package:vexana/vexana.dart';

part 'source_model.g.dart';

@JsonSerializable()
class SourceModel extends INetworkModel {
  SourceModel({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  @override
  fromJson(JsonMap json) {
    return _$SourceModelFromJson(json);
  }

  @override
  JsonMap toJson() {
    return _$SourceModelToJson(this);
  }

  factory SourceModel.fromJson(JsonMap json) => _$SourceModelFromJson(json);
}
