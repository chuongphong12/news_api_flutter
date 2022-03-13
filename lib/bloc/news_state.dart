part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<Article> news;

  const NewsLoaded({required this.news});

  @override
  List<Object> get props => [news];
}

class NewsError extends NewsState {
  final Failure failure;

  const NewsError({required this.failure});

  @override
  List<Object> get props => [failure];
}
