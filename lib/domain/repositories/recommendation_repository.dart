import '../entity/city.dart';
import '../entity/event.dart';
import '../entity/interest.dart';

abstract class RecommendationRepository {
  Future<List<Event>> getNearbyEvents();

  Future<List<Interest>> getAllInterests();

  Future<List<City>> getPopularCities();
}
