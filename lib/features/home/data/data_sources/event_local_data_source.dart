import 'package:ecassion/core/utility.dart';
import 'package:ecassion/features/home/data/dto/event_dto.dart';
import 'package:faker/faker.dart';

import 'category_local_data_source.dart';

class EventLocalDataSource {
  Future<List<EventDto>> getTrendingEvents() async {
    await Future.delayed(loadRandomDuration());

    return [
      EventDto(
        name: faker.sport.name() + " Cup",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        time: faker.date.dateTime(),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Open Nottingham",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        time: faker.date.dateTime(),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name(),
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        time: faker.date.dateTime(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.conference.name(),
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        time: faker.date.dateTime(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.address.city() + " " + faker.sport.name(),
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      )
    ];
  }

  Future<List<EventDto>> getUpcomingEvents() async {
    await Future.delayed(loadRandomDuration());
    return [
      EventDto(
        name: faker.sport.name() + " World Team Cup",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        time: faker.date.dateTime(),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + "Conference",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        time: faker.date.dateTime(),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + "World Cup",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(2000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        time: faker.date.dateTime(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name(),
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        time: faker.date.dateTime(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: randomImageUrl[random.integer(randomImageUrl.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
    ];
  }
}
