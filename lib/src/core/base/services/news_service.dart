import 'package:news_app/src/core/base/models/pagination_list_model.dart';
import 'package:news_app/src/core/base/models/source_model.dart';
import 'package:vexana/vexana.dart';
import '../models/articles_model.dart';
import '../models/paginated_list_response.dart';
import '../../constants/app/app_constants.dart';
import '../../constants/enums/app_enums.dart';
import 'interface_news_service.dart';

class NewsService extends INewsService {
  NewsService(super.networkManager);

  @override
  Future<List<ArticlesModel>> fetchNewsByCountry(String country) async {
    var response = await networkManager.send(
      NetworkEnums.topHeadlines.endpointName,
      parseModel: PaginatedListResponse(parseModel: ArticlesModel()),
      method: RequestType.GET,
      queryParameters: {
        "country": country,
        "apiKey": AppConstants.instance.apiKey
      },
    );
    return response.data.articles;
  }

  @override
  Future<List<SourceModel>> fetchAllSources() async {
    var response = await networkManager.send(
      "${NetworkEnums.topHeadlines.endpointName}/sources",
      parseModel: PaginationListModel(parseModel: SourceModel()),
      method: RequestType.GET,
      queryParameters: {"apiKey": AppConstants.instance.apiKey},
    );
    return response.data.sources;
  }

  @override
  Future<List<ArticlesModel>> fetchNewsBySource(String source) async {
    var response = await networkManager.send(
      NetworkEnums.topHeadlines.endpointName,
      parseModel: PaginatedListResponse(parseModel: ArticlesModel()),
      method: RequestType.GET,
      queryParameters: {
        "sources": source,
        "apiKey": AppConstants.instance.apiKey
      },
    );
    return response.data.articles;
  }

  @override
  Future<List<ArticlesModel>> fetchNewsBySearchWord(String searchWord) async {
    var response = await networkManager.send(
      NetworkEnums.topHeadlines.endpointName,
      parseModel: PaginatedListResponse(parseModel: ArticlesModel()),
      method: RequestType.GET,
      queryParameters: {
        "q": searchWord,
        "from": "2022-12-14",
        "sortBy": "popularity",
        "apiKey": AppConstants.instance.apiKey
      },
    );
    return response.data.articles;
  }
}
