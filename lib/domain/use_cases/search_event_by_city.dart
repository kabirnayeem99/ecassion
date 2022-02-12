import '../../data/repositories/search_repository_impl.dart';
import '../entity/city.dart';
import '../entity/event.dart';

class SearchEventByCity {
  final searchRepository = SearchRepositoryImpl();

  Future<List<Event>> getSearchResult(City city) {
    return searchRepository.searchEventByCity(city);
  }
}
