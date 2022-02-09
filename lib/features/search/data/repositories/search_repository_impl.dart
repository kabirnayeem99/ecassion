import 'package:ecassion/features/search/domain/entity/city.dart';
import 'package:ecassion/features/search/domain/entity/event.dart';
import 'package:ecassion/features/search/domain/entity/interest.dart';
import 'package:ecassion/features/search/domain/repositories/search_repository.dart';

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
