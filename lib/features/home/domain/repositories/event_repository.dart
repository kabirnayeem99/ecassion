import 'package:ecassion/features/home/domain/entity/trending_event.dart';

import '../entity/upcoming_event.dart';

abstract class EventRepository {
  Future<List<TrendingEvent>> getTrendingEvents();
  Future<List<UpcomingEvent>> getUpcomingEvents();
}
