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
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
        price: random.integer(10000),
        time: faker.date.dateTime(),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Open Nottingham",
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
        price: random.integer(10000),
        time: faker.date.dateTime(),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: "Viking Open Nottingham",
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
        price: random.integer(10000),
        address: "University Blvd, Nottingham NG7 2QH, UK",
        isSaved: random.boolean(),
        time: faker.date.dateTime(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: "cinch Championships",
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        time: faker.date.dateTime(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.address.city() + " " + faker.sport.name(),
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
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
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
        price: random.integer(10000),
        time: faker.date.dateTime(),
        address: "University Blvd, Nottingham NG7 2QH, UK",
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: "Viking Open Nottingham",
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
        price: random.integer(10000),
        time: faker.date.dateTime(),
        address: "Roland-Rainer-Platz 1, 1150 Wien, Austria",
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: "Viking Open Nottingham",
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
        price: random.integer(2000),
        address: "University Blvd, Nottingham NG7 2QH, UK",
        isSaved: random.boolean(),
        time: faker.date.dateTime(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: "cinch Championships",
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        time: faker.date.dateTime(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
      EventDto(
        name: faker.sport.name() + " Trophy",
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
        price: random.integer(10000),
        address: faker.address.city() + ", " + faker.address.country(),
        isSaved: random.boolean(),
        isTop: random.boolean(),
      ),
    ];
  }
}
