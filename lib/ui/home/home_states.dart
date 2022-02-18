import '../../domain/entity/category.dart';
import '../../domain/entity/trending_event.dart';
import '../../domain/entity/upcoming_event.dart';

abstract class HomeBlocState {}

class HomeBlocLoadingState extends HomeBlocState {}

class HomeBlocErrorState extends HomeBlocState {
  final String message;

  HomeBlocErrorState(this.message);
}

class HomeBlocSuccessState extends HomeBlocState {
  final HomePageUiState uiState;

  HomeBlocSuccessState(this.uiState);
}

class HomePageUiState {
  final List<TrendingEvent> trendingEvents;
  final List<UpcomingEvent> upcomingEvents;
  final List<Category> categories;
  final String profilePictureUrl;

  HomePageUiState({
    required this.trendingEvents,
    required this.upcomingEvents,
    required this.categories,
    required this.profilePictureUrl,
  });
}
