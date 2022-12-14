part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class FetchAllSourcesEvent extends NewsEvent {}

class FetchNewsByCountry extends NewsEvent {
  final String country;

  const FetchNewsByCountry(this.country);

  @override
  List<Object> get props => [country];
}
