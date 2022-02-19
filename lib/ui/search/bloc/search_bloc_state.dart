import '../../../domain/entity/city.dart';
import '../../../domain/entity/event.dart';
import '../../../domain/entity/interest.dart';

abstract class SearchBlocState {
  final String query;

  SearchBlocState(this.query);
}

class SearchBlocLoadingState extends SearchBlocState {
  SearchBlocLoadingState() : super("");
}

class SearchBlocErrorState extends SearchBlocState {
  final String message;

  SearchBlocErrorState({required this.message, required String query})
      : super(query);
}

class SearchBlocSearchingState extends SearchBlocState {
  final List<Event> searchResults;

  SearchBlocSearchingState({required this.searchResults, required String query})
      : super(query);
}

class SearchBlocNormalSuccessState extends SearchBlocState {
  final List<Interest> interests;
  final List<City> cities;
  final List<Event> nearbyEvents;

  SearchBlocNormalSuccessState({
    required this.interests,
    required this.cities,
    required this.nearbyEvents,
  }) : super("");
}
