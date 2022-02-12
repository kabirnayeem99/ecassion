import '../../data/repositories/search_repository_impl.dart';
import '../entity/event.dart';

class SearchEventByQuery {
  final searchRepository = SearchRepositoryImpl();

  Future<List<Event>> getSearchResult(String query) async {
    if (query.length < 3) {
      return searchRepository.searchEventByQuery(query);
    } else {
      return [];
    }
  }
}
