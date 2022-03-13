import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/article_model.dart';
import '../models/failure_model.dart';
import '../repository/api_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final ApiRepository apiRepository;
  NewsBloc({required this.apiRepository}) : super(NewsLoading()) {
    on<FetchNewsApi>((event, emit) async {
      emit(NewsLoading());
      final data = await apiRepository.getArticle();
      emit(NewsLoaded(news: data));
    });
  }
}
