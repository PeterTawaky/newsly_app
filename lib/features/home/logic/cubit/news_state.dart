part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsError extends NewsState {
  final String errorMessage;
  NewsError({required this.errorMessage});
}

final class NewsLoaded extends NewsState {
  final List<NewsModel> newsList;
  NewsLoaded({required this.newsList});
}
