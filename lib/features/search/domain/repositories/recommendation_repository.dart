import 'package:ecassion/features/search/domain/entity/city.dart';
import 'package:ecassion/features/search/domain/entity/event.dart';
import 'package:ecassion/features/search/domain/entity/interest.dart';

abstract class RecommendationRepository {
  Future<List<Event>> getNearbyEvents();

  Future<List<Interest>> getAllInterests();

  Future<List<City>> getPopularCities();
}
