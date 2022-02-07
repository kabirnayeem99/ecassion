import 'package:ecassion/features/home/domain/entity/upcoming_event.dart';
import 'package:ecassion/features/home/domain/repositories/event_repository.dart';
import 'package:flutter/foundation.dart';

import '../../data/repositories/event_repository_impl.dart';

class GetUpcomingEvent {
  final EventRepository eventRepository = EventRepositoryImpl();

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
