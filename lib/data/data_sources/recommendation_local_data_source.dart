import 'package:ecassion/core/utility.dart';
import 'package:ecassion/domain/entity/event.dart';
import 'package:faker/faker.dart';

import '../dto/city_dto.dart';
import '../dto/event_dto.dart';
import '../dto/interest_dto.dart';
import 'category_local_data_source.dart';

class RecommendationDataSource {
  Future<String> getCurrentLocation() async {
    return "Chattogram, Bangladesh";
  }

  Future<List<EventDto>> getNearbyEvents() async {
    await Future.delayed(loadRandomDuration());

    final currentLocation = await getCurrentLocation();

    return [
      EventDto(
        name: faker.sport.name() + " World Team Cup",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        time: faker.date.dateTime(),
        address: currentLocation,
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + "Conference",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        time: faker.date.dateTime(),
        address: currentLocation,
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + "World Cup",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(2000),
        address: currentLocation,
        isSaved: random.boolean(),
        time: faker.date.dateTime(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name(),
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        address: currentLocation,
        isSaved: random.boolean(),
        time: faker.date.dateTime(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        address: currentLocation,
        isSaved: random.boolean(),
        isTop: random.boolean(),
      )
    ];
  }

  Future<List<CityDto>> getPopularCities() async {
    await Future.delayed(loadRandomDuration());
    return [
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
  }

  Future<List<InterestDto>> getAllInterests() async {
    await Future.delayed(loadRandomDuration());

    return [
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
  }

  Future<List<EventDto>> getRecommendedEventByEvent(Event event) async {
    await Future.delayed(loadRandomDuration());
    return [
      EventDto(
        name: faker.sport.name() + " World Team Cup",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        time: faker.date.dateTime(),
        address: event.address,
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Conference",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        time: faker.date.dateTime(),
        address: event.address,
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + "World Cup",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(2000),
        address: event.address,
        isSaved: random.boolean(),
        time: faker.date.dateTime(),
        isTop: random.boolean(),
      ),
    ];
  }
}
