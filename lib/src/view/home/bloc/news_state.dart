part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class FetchAllSourcesLoading extends NewsState {}

class FetchAllSourcesLoaded extends NewsState {
  final List<SourceModel> sources;

  const FetchAllSourcesLoaded(this.sources);

  @override
  List<Object> get props => [sources];
}

class FetchAllSourcesError extends NewsState {
  final String errorMessage;

  const FetchAllSourcesError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class FetchNewsByCountryLoading extends NewsState {}

class FetchNewsByCountryLoaded extends NewsState {
  final List<ArticlesModel> articles;

  const FetchNewsByCountryLoaded(this.articles);

  @override
  List<Object> get props => [articles];
}

class FetchNewsByCountryError extends NewsState {
  final String errorMessage;

  const FetchNewsByCountryError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}