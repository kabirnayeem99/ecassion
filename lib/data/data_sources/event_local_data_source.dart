import 'package:ecassion/data/dto/event_details_dto.dart';
import 'package:ecassion/data/dto/user_dto.dart';
import 'package:faker/faker.dart';

import '../../../../core/utility.dart';
import '../dto/event_dto.dart';
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

  Future<EventDetailsDto> getEventDetailsByIndex(int index) async {
    final trendingEvents = await getTrendingEvents();
    final eventDto = trendingEvents[index];

    final eventOwner = await getEventOwner(index);
    final sharedUsers = await getSharedByUsers(index);

    final recommendedEvents = await getRecommendedEventByEvent(eventDto);

    EventDetailsDto eventDetails = EventDetailsDto(
      name: eventDto.name,
      imageUrl: eventDto.imageUrl,
      price: eventDto.price,
      time: eventDto.time,
      address: eventDto.address,
      isSaved: eventDto.isSaved,
      isTop: eventDto.isTop,
      sharedUsers: sharedUsers,
      recommendedEvents: recommendedEvents,
      about: faker.lorem.sentence() + faker.lorem.sentence(),
      lat: random.integer(200) + random.decimal(),
      lng: random.integer(200) + random.decimal(),
      eventBy: eventOwner,
    );

    return eventDetails;
  }

  Future<List<EventDto>> getRecommendedEventByEvent(EventDto event) async {
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

  Future<UserDto> getEventOwner(int index) async {
    return UserDto(
      id: faker.guid.guid(),
      imageUrl:
          "https://pbs.twimg.com/profile_images/865695281492381696/81tOUsc7_400x400.jpg",
      name: faker.person.name(),
      email: faker.lorem.word() + "@" + faker.lorem.word() + ".com",
      phoneNumber: faker.phoneNumber.us(),
    );
  }

  Future<List<UserDto>> getSharedByUsers(int index) async {
    return [
      UserDto(
        id: faker.guid.guid(),
        imageUrl:
            "https://pbs.twimg.com/profile_images/865695281492381696/81tOUsc7_400x400.jpg",
        name: faker.person.name(),
        email: faker.lorem.word() + "@" + faker.lorem.word() + ".com",
        phoneNumber: faker.phoneNumber.us(),
      ),
      UserDto(
        id: faker.guid.guid(),
        imageUrl:
            "https://pbs.twimg.com/profile_images/865695281492381696/81tOUsc7_400x400.jpg",
        name: faker.person.name(),
        email: faker.lorem.word() + "@" + faker.lorem.word() + ".com",
        phoneNumber: faker.phoneNumber.us(),
      ),
      UserDto(
        id: faker.guid.guid(),
        imageUrl:
            "https://pbs.twimg.com/profile_images/865695281492381696/81tOUsc7_400x400.jpg",
        name: faker.person.name(),
        email: faker.lorem.word() + "@" + faker.lorem.word() + ".com",
        phoneNumber: faker.phoneNumber.us(),
      ),
      UserDto(
        id: faker.guid.guid(),
        imageUrl:
            "https://pbs.twimg.com/profile_images/865695281492381696/81tOUsc7_400x400.jpg",
        name: faker.person.name(),
        email: faker.lorem.word() + "@" + faker.lorem.word() + ".com",
        phoneNumber: faker.phoneNumber.us(),
      ),
      UserDto(
        id: faker.guid.guid(),
        imageUrl:
            "https://pbs.twimg.com/profile_images/865695281492381696/81tOUsc7_400x400.jpg",
        name: faker.person.name(),
        email: faker.lorem.word() + "@" + faker.lorem.word() + ".com",
        phoneNumber: faker.phoneNumber.us(),
      ),
      UserDto(
        id: faker.guid.guid(),
        imageUrl:
            "https://pbs.twimg.com/profile_images/865695281492381696/81tOUsc7_400x400.jpg",
        name: faker.person.name(),
        email: faker.lorem.word() + "@" + faker.lorem.word() + ".com",
        phoneNumber: faker.phoneNumber.us(),
      ),
    ];
  }
}
