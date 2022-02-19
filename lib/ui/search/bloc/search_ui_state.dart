import '../../../domain/entity/city.dart';
import '../../../domain/entity/event.dart';
import '../../../domain/entity/interest.dart';

class SearchUiState {
  bool isLoading = false;
  bool isSearching = false;
  List<Interest> interests = [];
  List<City> cities = [];
  List<Event> nearbyEvents = [];
}
