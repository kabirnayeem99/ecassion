import 'package:ecassion/data/data_sources/category_local_data_source.dart';
import 'package:ecassion/domain/use_cases/get_categories.dart';
import 'package:ecassion/domain/use_cases/get_trending_event.dart';
import 'package:ecassion/domain/use_cases/get_upcoming_event.dart';
import 'package:ecassion/ui/home/bloc/home_events.dart';
import 'package:ecassion/ui/home/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  final _container = KiwiContainer();

  late GetTrendingEvent _getTrendingEvent;
  late GetUpcomingEvent _getUpcomingEvent;
  late GetCategories _getCategories;

  HomeBloc(HomeBlocState initialState) : super(initialState) {
    _setUpUseCases();
    _onInitialLoadingEvent();
  }

  void _onInitialLoadingEvent() {
    on<InitialBlocLoadEvent>(
      (event, emit) async {
        final _trendingEvents = await _getTrendingEvent.getTrendingEvents();
        final _categories = await _getCategories.getCategoryList();
        final _upcomingEvents = await _getUpcomingEvent.getUpcomingEvents();

        final successUiState = HomePageUiState(
          trendingEvents: _trendingEvents,
          categories: _categories,
          upcomingEvents: _upcomingEvents,
          profilePictureUrl: loadRandomImageUrl(),
        );

        emit(HomeBlocSuccessState(successUiState));
      },
    );
  }

  void _setUpUseCases() {
    _getTrendingEvent = _container.resolve<GetTrendingEvent>();
    _getUpcomingEvent = _container.resolve<GetUpcomingEvent>();
    _getCategories = _container.resolve<GetCategories>();
  }
}
