import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/src/core/init/network/vexana_manager.dart';
import 'package:news_app/src/view/home/service/interface_news_service.dart';
import 'package:news_app/src/view/home/service/news_service.dart';

void main() {
  late INewsService newsService;
  setUp(() {
    newsService = NewsService(VexanaManager.instance.networkManager);
  });

  test('deneme1', () async {
    var response = await newsService.fetchNewsByCountry("us");
    expect(response, isNotEmpty);
  });

  test('deneme2', () async {
    var response = await newsService.fetchNewsBySearchWord("Apple");
    expect(response, isNotEmpty);
  });

  test('deneme3', () async {
    var response = await newsService.fetchNewsBySource("bbc-news");
    expect(response, isNotEmpty);
  });
}
