import 'package:ecassion/domain/repositories/search_repository.dart';

import '../entity/event.dart';
import '../entity/interest.dart';

class SearchEventByInterest {
  final SearchRepository _searchRepository;

  SearchEventByInterest(this._searchRepository);

  Future<List<Event>> getSearchResult(Interest interest) {
    return _searchRepository.searchEventByInterest(interest);
  }
}
