import 'package:ecassion/features/home/domain/repositories/event_repository.dart';
import 'package:flutter/foundation.dart';

import '../../data/repositories/event_repository_impl.dart';
import '../entity/trending_event.dart';

class GetTrendingEvent {
  final EventRepository eventRepository = EventRepositoryImpl();

  Future<List<TrendingEvent>> getTrendingEvents() {
    try {
      return eventRepository.getTrendingEvents();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Future.value(<TrendingEvent>[]);
    }
  }
}
