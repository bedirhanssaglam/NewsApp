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

class FetchSearchedNewsLoading extends NewsState {}

class FetchSearchedNewsLoaded extends NewsState {
  final List<ArticlesModel> articles;

  const FetchSearchedNewsLoaded(this.articles);

  @override
  List<Object> get props => [articles];
}

class FetchSearchedNewsError extends NewsState {
  final String errorMessage;

  const FetchSearchedNewsError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class FetchNewsBySourceLoading extends NewsState {}

class FetchNewsBySourceLoaded extends NewsState {
  final List<ArticlesModel> articles;

  const FetchNewsBySourceLoaded(this.articles);

  @override
  List<Object> get props => [articles];
}

class FetchNewsBySourceError extends NewsState {
  final String errorMessage;

  const FetchNewsBySourceError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
