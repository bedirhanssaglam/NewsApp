import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/src/core/base/models/articles_model.dart';
import 'package:news_app/src/core/base/models/source_model.dart';
import 'package:news_app/src/core/base/services/interface_news_service.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final INewsService newsService;
  NewsBloc(this.newsService) : super(NewsInitial()) {
    on<FetchAllSourcesEvent>(_onFetchAllSources);
    on<FetchNewsByCountry>(_onFetchNewsByCountry);
    on<FetchSearchedNews>(_onFetchSearchedNews);
    on<FetchNewsBySource>(_onFetchNewsBySource);
  }

  Future<void> _onFetchAllSources(
      FetchAllSourcesEvent event, Emitter<NewsState> emit) async {
    try {
      emit(FetchAllSourcesLoading());
      List<SourceModel> res = await newsService.fetchAllSources();
      emit(FetchAllSourcesLoaded(res));
    } catch (e) {
      emit(FetchAllSourcesError(e.toString()));
    }
  }

  Future<void> _onFetchNewsByCountry(
      FetchNewsByCountry event, Emitter<NewsState> emit) async {
    try {
      emit(FetchNewsByCountryLoading());
      List<ArticlesModel> res =
          await newsService.fetchNewsByCountry(event.country);
      emit(FetchNewsByCountryLoaded(res));
    } catch (e) {
      emit(FetchNewsByCountryError(e.toString()));
    }
  }

  Future<void> _onFetchSearchedNews(
      FetchSearchedNews event, Emitter<NewsState> emit) async {
    try {
      emit(FetchSearchedNewsLoading());
      List<ArticlesModel> res =
          await newsService.fetchNewsBySearchWord(event.searchWord);
      emit(FetchSearchedNewsLoaded(res));
    } catch (e) {
      emit(FetchSearchedNewsError(e.toString()));
    }
  }

  Future<void> _onFetchNewsBySource(
      FetchNewsBySource event, Emitter<NewsState> emit) async {
    try {
      emit(FetchNewsBySourceLoading());
      List<ArticlesModel> res =
          await newsService.fetchNewsBySource(event.source);
      emit(FetchNewsBySourceLoaded(res));
    } catch (e) {
      emit(FetchNewsBySourceError(e.toString()));
    }
  }
}
