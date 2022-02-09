import 'package:ecassion/features/search/domain/entity/city.dart';
import 'package:ecassion/features/search/domain/entity/event.dart';
import 'package:ecassion/features/search/domain/entity/interest.dart';
import 'package:ecassion/features/search/domain/repositories/search_repository.dart';

class SearchRepositoryImpl extends SearchRepository {
  @override
  List<Event> searchEventByCity(City city) {
    return [];
  }

  @override
  List<Event> searchEventByInterest(Interest interest) {
    return [];
  }

  @override
  List<Event> searchEventByQuery(String query) {
    return [];
  }
}
