import '../../domain/entity/city.dart';
import '../../domain/entity/event.dart';
import '../../domain/entity/interest.dart';
import '../../domain/repositories/search_repository.dart';

class SearchRepositoryImpl extends SearchRepository {
  @override
  Future<List<Event>> searchEventByCity(City city) async {
    return [];
  }

  @override
  Future<List<Event>> searchEventByInterest(Interest interest) async {
    return [];
  }

  @override
  Future<List<Event>> searchEventByQuery(String query) async {
    return [];
  }
}