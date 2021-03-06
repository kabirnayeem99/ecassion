import 'package:ecassion/core/extenstions.dart';
import 'package:ecassion/core/utility.dart';
import 'package:faker/faker.dart';

import '../../domain/entity/city.dart';
import '../../domain/entity/interest.dart';
import '../dto/event_dto.dart';
import 'category_local_data_source.dart';

class SearchLocalDataSource {
  static final SearchLocalDataSource _singleton =
      SearchLocalDataSource._internal();

  factory SearchLocalDataSource() {
    return _singleton;
  }

  SearchLocalDataSource._internal();

  Future<List<EventDto>> searchEventByCity(City city) async {
    await Future.delayed(loadRandomDuration());
    return [
      EventDto(
        name: faker.sport.name() + " World Team Cup",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        time: faker.date.dateTime(),
        address: city.name + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + "Conference",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        time: faker.date.dateTime(),
        address: city.name + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + "World Cup",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(2000),
        address: city.name + ", " + faker.address.country(),
        isSaved: random.boolean(),
        time: faker.date.dateTime(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name(),
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        address: city.name + ", " + faker.address.country(),
        isSaved: random.boolean(),
        time: faker.date.dateTime(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        address: city.name + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      )
    ];
  }

  Future<List<EventDto>> searchEventByInterest(Interest interest) async {
    await Future.delayed(loadRandomDuration());
    return [
      EventDto(
        name: interest.name + " World Team Cup",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        time: faker.date.dateTime(),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: interest.name + "Conference",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        time: faker.date.dateTime(),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: interest.name + "World Cup",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(2000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        time: faker.date.dateTime(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: interest.name,
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        time: faker.date.dateTime(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: interest.name + " Trophy",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      )
    ];
  }

  Future<List<EventDto>> searchEventByQuery(String query) async {
    await Future.delayed(loadRandomDuration());
    return [
      EventDto(
        name: "The " + query.capitalize() + " World Team Cup",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        time: faker.date.dateTime(),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: "The " + query.capitalize() + " Conference",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        time: faker.date.dateTime(),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: "The " + query.capitalize() + " World Cup",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(2000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        time: faker.date.dateTime(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: "The " + query.capitalize(),
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        time: faker.date.dateTime(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: "The " + query.capitalize() + " Trophy",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
    ];
  }
}
