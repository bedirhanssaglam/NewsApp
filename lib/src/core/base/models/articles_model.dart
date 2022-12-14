import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/src/core/base/models/source_model.dart';
import 'package:news_app/src/core/utils/typedefs.dart';
import 'package:vexana/vexana.dart';

part 'articles_model.g.dart';

@JsonSerializable()
class ArticlesModel extends INetworkModel {
  ArticlesModel({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  SourceModel? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  @override
  fromJson(JsonMap json) {
    return _$ArticlesModelFromJson(json);
  }

  @override
  JsonMap toJson() {
    return _$ArticlesModelToJson(this);
  }

  factory ArticlesModel.fromJson(JsonMap json) => _$ArticlesModelFromJson(json);
}
