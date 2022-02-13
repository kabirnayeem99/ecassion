import 'package:ecassion/core/utility.dart';
import 'package:ecassion/data/data_sources/event_local_data_source.dart';
import 'package:ecassion/domain/entity/event.dart';
import 'package:faker/faker.dart';

import '../dto/city_dto.dart';
import '../dto/event_dto.dart';
import '../dto/interest_dto.dart';
import 'category_local_data_source.dart';

class RecommendationDataSource {
  static final RecommendationDataSource _singleton =
      RecommendationDataSource._internal();

  factory RecommendationDataSource() {
    return _singleton;
  }

  RecommendationDataSource._internal();

  final _events = EventLocalDataSource().events;

  final _interests = [
    InterestDto(
      id: faker.guid.guid(),
      imageUrl: loadRandomImageUrl(),
      name: faker.sport.name(),
    ),
    InterestDto(
      id: faker.guid.guid(),
      imageUrl: loadRandomImageUrl(),
      name: faker.sport.name(),
    ),
    InterestDto(
      id: faker.guid.guid(),
      imageUrl: loadRandomImageUrl(),
      name: faker.sport.name(),
    ),
    InterestDto(
      id: faker.guid.guid(),
      imageUrl: loadRandomImageUrl(),
      name: faker.sport.name(),
    ),
    InterestDto(
      id: faker.guid.guid(),
      imageUrl: loadRandomImageUrl(),
      name: faker.sport.name(),
    ),
    InterestDto(
      id: faker.guid.guid(),
      imageUrl: loadRandomImageUrl(),
      name: faker.sport.name(),
    ),
  ];

  final _cities = [
    CityDto(
        id: faker.guid.guid(),
        name: faker.address.city(),
        imageUrl: loadRandomImageUrl()),
    CityDto(
        id: faker.guid.guid(),
        name: faker.address.city(),
        imageUrl: loadRandomImageUrl()),
    CityDto(
      id: faker.guid.guid(),
      name: faker.address.city(),
      imageUrl: loadRandomImageUrl(),
    ),
    CityDto(
      id: faker.guid.guid(),
      name: faker.address.city(),
      imageUrl: loadRandomImageUrl(),
    ),
    CityDto(
      id: faker.guid.guid(),
      name: faker.address.city(),
      imageUrl: loadRandomImageUrl(),
    ),
  ];

  final _address = "${faker.address.city()}, ${faker.address.country()}";

  Future<String> getCurrentLocation() async {
    return _address;
  }

  Future<List<EventDto>> getNearbyEvents() async {
    await Future.delayed(loadRandomDuration());
    final currentLocation = await getCurrentLocation();
    final nearbyEvents = _events
        .take(8)
        .map((event) => event.copyWith(address: currentLocation))
        .toList(growable: false);
    return nearbyEvents;
  }

  Future<List<CityDto>> getPopularCities() async {
    await Future.delayed(loadRandomDuration());
    return _cities;
  }

  Future<List<InterestDto>> getAllInterests() async {
    await Future.delayed(loadRandomDuration());
    return _interests;
  }

  Future<List<EventDto>> getRecommendedEventByEvent(Event event) async {
    await Future.delayed(loadRandomDuration());
    return _events.take(8).toList(growable: false);
  }
}
