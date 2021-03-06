import 'package:ecassion/data/dto/mapper/city_dto_to_city.dart';
import 'package:ecassion/data/dto/mapper/event_dto_to_event_mapper.dart';
import 'package:ecassion/data/dto/mapper/interest_dto_to_interest.dart';

import '../../domain/entity/city.dart';
import '../../domain/entity/event.dart';
import '../../domain/entity/interest.dart';
import '../../domain/repositories/recommendation_repository.dart';
import '../data_sources/recommendation_local_data_source.dart';

class RecommendationRepositoryImpl extends RecommendationRepository {
  final RecommendationDataSource recommendationLocalDataSource;

  RecommendationRepositoryImpl(this.recommendationLocalDataSource);

  @override
  Future<List<Event>> getNearbyEvents() async {
    try {
      final nearbyEventsDto =
          await recommendationLocalDataSource.getNearbyEvents();
      final nearbyEvents = nearbyEventsDto
          .map((dto) => EventParsing(dto).mapToEvent())
          .toList(growable: false);
      return nearbyEvents;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<List<Interest>> getAllInterests() async {
    try {
      final interestsDto =
          await recommendationLocalDataSource.getAllInterests();

      final interests = interestsDto
          .map((dto) => InterestParsing(dto).mapToInterest())
          .toList(growable: false);

      return interests;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<List<City>> getPopularCities() async {
    try {
      final citiesDto = await recommendationLocalDataSource.getPopularCities();

      final cities = citiesDto
          .map((dto) => CityParsing(dto).mapToCity())
          .toList(growable: false);

      return cities;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
