import '../../data/repositories/search_repository_impl.dart';
import '../entity/event.dart';
import '../entity/interest.dart';

class SearchEventByInterest {
  final searchRepository = SearchRepositoryImpl();

  Future<List<Event>> getSearchResult(Interest interest) {
    return searchRepository.searchEventByInterest(interest);
  }
}
