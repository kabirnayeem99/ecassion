import 'package:ecassion/domain/repositories/search_repository.dart';

import '../entity/city.dart';
import '../entity/event.dart';

class SearchEventByCity {
  final SearchRepository _searchRepository;

  SearchEventByCity(this._searchRepository);

  Future<List<Event>> getSearchResult(City city) {
    return _searchRepository.searchEventByCity(city);
  }
}
