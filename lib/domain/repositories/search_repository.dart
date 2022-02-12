import '../entity/city.dart';
import '../entity/event.dart';
import '../entity/interest.dart';

abstract class SearchRepository {
  Future<List<Event>> searchEventByCity(City city);

  Future<List<Event>> searchEventByQuery(String query);

  Future<List<Event>> searchEventByInterest(Interest interest);
}
