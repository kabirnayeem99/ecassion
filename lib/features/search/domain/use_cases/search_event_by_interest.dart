import 'package:ecassion/features/search/data/repositories/search_repository_impl.dart';
import 'package:ecassion/features/search/domain/entity/event.dart';
import 'package:ecassion/features/search/domain/entity/interest.dart';

class SearchEventByInterest {
  final searchRepository = SearchRepositoryImpl();

  Future<List<Event>> getSearchResult(Interest interest) {
    return searchRepository.searchEventByInterest(interest);
  }
}
