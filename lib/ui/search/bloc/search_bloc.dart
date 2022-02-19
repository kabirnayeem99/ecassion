import 'package:ecassion/domain/use_cases/get_interests.dart';
import 'package:ecassion/domain/use_cases/get_nearby_events.dart';
import 'package:ecassion/domain/use_cases/get_popular_cities.dart';
import 'package:ecassion/domain/use_cases/search_event_by_query.dart';
import 'package:ecassion/ui/search/bloc/search_bloc_event.dart';
import 'package:ecassion/ui/search/bloc/search_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

class SearchBloc extends Bloc<SearchBlocEvent, SearchBlocState> {
  final _container = KiwiContainer();
  late GetInterests _getInterests;
  late GetNearbyEvents _getNearbyEvents;
  late GetPopularCities _getPopularCities;
  late SearchEventByQuery _searchEventByQuery;

  SearchBloc(SearchBlocState initialState) : super(initialState) {
    _setUpUseCases();
    _attachOnInitialLoadEventListener();
    _attachOnSearchEventListener();
    _attachOnAfterClearLoadingEventListener();
  }

  void _attachOnInitialLoadEventListener() {
    on<SearchBlocInitialLoadingEvent>((event, emit) async {
      emit(SearchBlocLoadingState());

      final _cities = await _getPopularCities.getCities();
      final _interests = await _getInterests.getInterests();
      final _events = await _getNearbyEvents.getNearbyEvents();

      final SearchBlocNormalSuccessState _normalSuccessState =
          SearchBlocNormalSuccessState(
        cities: _cities,
        interests: _interests,
        nearbyEvents: _events,
      );

      emit(_normalSuccessState);
    });
  }

  void _attachOnAfterClearLoadingEventListener() {
    on<SearchBlocAfterClearLoadingEvent>((event, emit) async {
      final _cities = await _getPopularCities.getCities();
      final _interests = await _getInterests.getInterests();
      final _events = await _getNearbyEvents.getNearbyEvents();

      final SearchBlocNormalSuccessState _normalSuccessState =
          SearchBlocNormalSuccessState(
        cities: _cities,
        interests: _interests,
        nearbyEvents: _events,
      );

      emit(_normalSuccessState);
    });
  }

  void _attachOnSearchEventListener() {
    on<SearchBlocSearchByQueryEvent>((event, emit) async {
      final _events = await _searchEventByQuery.getSearchResult(event.query);

      final SearchBlocSearchingState _searchState =
          SearchBlocSearchingState(searchResults: _events, query: event.query);

      emit(_searchState);
    });
  }

  void _setUpUseCases() {
    _getPopularCities = _container.resolve<GetPopularCities>();
    _getNearbyEvents = _container.resolve<GetNearbyEvents>();
    _getInterests = _container.resolve<GetInterests>();
    _searchEventByQuery = _container.resolve<SearchEventByQuery>();
  }
}
