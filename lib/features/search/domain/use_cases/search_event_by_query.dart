import 'package:ecassion/features/search/data/repositories/search_repository_impl.dart';
import 'package:ecassion/features/search/domain/entity/event.dart';

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
