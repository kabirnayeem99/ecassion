import 'package:ecassion/domain/entity/event_details.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/entity/event.dart';
import '../../../domain/entity/trending_event.dart';
import '../../../domain/entity/upcoming_event.dart';
import '../event_details_dto.dart';
import '../event_dto.dart';

extension EventParsing on EventDto {
  Event mapToEvent() {
    return Event(
      name: name,
      imageUrl: imageUrl,
      price: price,
      time: time,
      address: address,
      isSaved: isSaved,
      isTop: isTop,
    );
  }

  TrendingEvent mapToTrendingEvent() {
    return TrendingEvent(
      name: name,
      imageUrl: imageUrl,
      price: price,
      time: time,
      address: address,
      isSaved: isSaved,
      isTop: isTop,
    );
  }

  UpcomingEvent mapToUpcomingEvent() {
    return UpcomingEvent(
      name: name,
      imageUrl: imageUrl,
      address: address,
      isSaved: isSaved,
    );
  }
}

extension EventDetailsParsing on EventDetailsDto {
  EventDetails mapToEventDetails() {
    var recommendedEventList = <Event>[];

    try {
      recommendedEventList = recommendedEvents.map((event) {
        return EventParsing(event).mapToEvent();
      }).toList(growable: false);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return EventDetails(
      name: name,
      imageUrl: imageUrl,
      price: price,
      time: time,
      address: address,
      isSaved: isSaved,
      isTop: isTop,
      sharedUsers: sharedUsers,
      about: about,
      lat: lat,
      lng: lng,
      eventBy: eventBy,
      recommendedEvents: recommendedEventList,
    );
  }
}
