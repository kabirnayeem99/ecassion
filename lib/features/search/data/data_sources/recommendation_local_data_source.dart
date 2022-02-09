import 'package:ecassion/features/search/data/dto/event_dto.dart';
import 'package:faker/faker.dart';

import '../../../home/data/data_sources/category_local_data_source.dart';
import '../dto/city_dto.dart';
import '../dto/interest_dto.dart';

class RecommendationDataSource {
  Future<String> getCurrentLocation() async {
    return "Chattogram, Bangladesh";
  }

  Future<List<EventDto>> getNearbyEvents() async {
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
}
