import 'package:news_app/src/core/base/models/articles_model.dart';
import 'package:news_app/src/core/base/models/source_model.dart';
import 'package:vexana/vexana.dart';

abstract class INewsService {
  final INetworkManager networkManager;

  INewsService(this.networkManager);

  Future<List<ArticlesModel>> fetchNewsByCountry(String country);
  Future<List<ArticlesModel>> fetchNewsBySource(String source);
  Future<List<ArticlesModel>> fetchNewsBySearchWord(String searchWord);
  Future<List<SourceModel>> fetchAllSources();
}
