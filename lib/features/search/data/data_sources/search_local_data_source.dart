import 'package:ecassion/features/search/data/dto/event_dto.dart';
import 'package:faker/faker.dart';

import '../../../home/data/data_sources/category_local_data_source.dart';
import '../../domain/entity/city.dart';
import '../../domain/entity/interest.dart';

class SearchLocalDataSource {
  Future<List<EventDto>> searchEventByCity(City city) async {
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
    return [
      EventDto(
        name: "The " + query + " World Team Cup",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        time: faker.date.dateTime(),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: "The " + query + "Conference",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        time: faker.date.dateTime(),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: "The " + query + "World Cup",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(2000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        time: faker.date.dateTime(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: "The " + query,
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        time: faker.date.dateTime(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: "The " + query + " Trophy",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
    ];
  }
}
