import '../entity/event.dart';
import '../repositories/search_repository.dart';

class SearchEventByQuery {
  final SearchRepository _searchRepository;

  SearchEventByQuery(this._searchRepository);

  Future<List<Event>> getSearchResult(String query) async {
    return _searchRepository.searchEventByQuery(query);
  }
}
