import 'package:faker/faker.dart';

import '../../core/utility.dart';
import '../../domain/entity/notification.dart';
import 'category_local_data_source.dart';

class NotificationLocalDataSource {
  static final NotificationLocalDataSource _singleton =
      NotificationLocalDataSource._internal();

  factory NotificationLocalDataSource() {
    return _singleton;
  }

  NotificationLocalDataSource._internal();

  final _notifications = [
    NotificationItem(
      id: faker.guid.guid(),
      imageUrl: loadRandomImageUrl(),
      title: faker.lorem.sentence(),
      time: faker.date.time(),
    ),    NotificationItem(
      id: faker.guid.guid(),
      imageUrl: loadRandomImageUrl(),
      title: faker.lorem.sentence(),
      time: faker.date.time(),
    ),    NotificationItem(
      id: faker.guid.guid(),
      imageUrl: loadRandomImageUrl(),
      title: faker.lorem.sentence(),
      time: faker.date.time(),
    ),    NotificationItem(
      id: faker.guid.guid(),
      imageUrl: loadRandomImageUrl(),
      title: faker.lorem.sentence(),
      time: faker.date.time(),
    ),    NotificationItem(
      id: faker.guid.guid(),
      imageUrl: loadRandomImageUrl(),
      title: faker.lorem.sentence(),
      time: faker.date.time(),
    ),    NotificationItem(
      id: faker.guid.guid(),
      imageUrl: loadRandomImageUrl(),
      title: faker.lorem.sentence(),
      time: faker.date.time(),
    ),    NotificationItem(
      id: faker.guid.guid(),
      imageUrl: loadRandomImageUrl(),
      title: faker.lorem.sentence(),
      time: faker.date.dateTime(minYear: 2012, maxYear: 2022).toIso8601String(),
    ), NotificationItem(
      id: faker.guid.guid(),
      imageUrl: loadRandomImageUrl(),
      title: faker.lorem.sentence(),
      time: faker.date.dateTime(minYear: 2012, maxYear: 2022).toIso8601String(),
    ), NotificationItem(
      id: faker.guid.guid(),
      imageUrl: loadRandomImageUrl(),
      title: faker.lorem.sentence(),
      time: faker.date.dateTime(minYear: 2012, maxYear: 2022).toIso8601String(),
    ), NotificationItem(
      id: faker.guid.guid(),
      imageUrl: loadRandomImageUrl(),
      title: faker.lorem.sentence(),
      time: faker.date.dateTime(minYear: 2012, maxYear: 2022).toIso8601String(),
    ), NotificationItem(
      id: faker.guid.guid(),
      imageUrl: loadRandomImageUrl(),
      title: faker.lorem.sentence(),
      time: faker.date.dateTime(minYear: 2012, maxYear: 2022).toIso8601String(),
    ), NotificationItem(
      id: faker.guid.guid(),
      imageUrl: loadRandomImageUrl(),
      title: faker.lorem.sentence(),
      time: faker.date.dateTime(minYear: 2012, maxYear: 2022).toIso8601String(),
    ), NotificationItem(
      id: faker.guid.guid(),
      imageUrl: loadRandomImageUrl(),
      title: faker.lorem.sentence(),
      time: faker.date.dateTime(minYear: 2012, maxYear: 2022).toIso8601String(),
    ), NotificationItem(
      id: faker.guid.guid(),
      imageUrl: loadRandomImageUrl(),
      title: faker.lorem.sentence(),
      time: faker.date.dateTime(minYear: 2012, maxYear: 2022).toIso8601String(),
    ), NotificationItem(
      id: faker.guid.guid(),
      imageUrl: loadRandomImageUrl(),
      title: faker.lorem.sentence(),
      time: faker.date.dateTime(minYear: 2012, maxYear: 2022).toIso8601String(),
    ), NotificationItem(
      id: faker.guid.guid(),
      imageUrl: loadRandomImageUrl(),
      title: faker.lorem.sentence(),
      time: faker.date.dateTime(minYear: 2012, maxYear: 2022).toIso8601String(),
    ), NotificationItem(
      id: faker.guid.guid(),
      imageUrl: loadRandomImageUrl(),
      title: faker.lorem.sentence(),
      time: faker.date.dateTime(minYear: 2012, maxYear: 2022).toIso8601String(),
    ), NotificationItem(
      id: faker.guid.guid(),
      imageUrl: loadRandomImageUrl(),
      title: faker.lorem.sentence(),
      time: faker.date.dateTime(minYear: 2012, maxYear: 2022).toIso8601String(),
    ), NotificationItem(
      id: faker.guid.guid(),
      imageUrl: loadRandomImageUrl(),
      title: faker.lorem.sentence(),
      time: faker.date.dateTime(minYear: 2012, maxYear: 2022).toIso8601String(),
    ), NotificationItem(
      id: faker.guid.guid(),
      imageUrl: loadRandomImageUrl(),
      title: faker.lorem.sentence(),
      time: faker.date.dateTime(minYear: 2012, maxYear: 2022).toIso8601String(),
    ),
  ];

  final notification = NotificationItem(
    id: "",
    imageUrl: loadRandomImageUrl(),
    title: "This is the title",
    time: "4 March 2022, 3:37 PM",
  );

  Future<List<NotificationItem>> getAllNotifications() async {
    await Future.delayed(loadRandomDuration());
    return _notifications;
  }
}
