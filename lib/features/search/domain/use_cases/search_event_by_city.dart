import 'package:ecassion/features/search/data/repositories/search_repository_impl.dart';
import 'package:ecassion/features/search/domain/entity/city.dart';
import 'package:ecassion/features/search/domain/entity/event.dart';

class SearchEventByCity {

  final searchRepository = SearchRepositoryImpl();

  Future<List<Event>> getSearchResult(City city) {

  }
}
