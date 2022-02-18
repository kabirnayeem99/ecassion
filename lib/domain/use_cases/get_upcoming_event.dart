import 'package:flutter/foundation.dart';

import '../entity/upcoming_event.dart';
import '../repositories/event_repository.dart';

class GetUpcomingEvent {
  final EventRepository eventRepository;

  GetUpcomingEvent(this.eventRepository);

  Future<List<UpcomingEvent>> getUpcomingEvents() {
    try {
      return eventRepository.getUpcomingEvents();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Future.value(<UpcomingEvent>[]);
    }
  }
}
