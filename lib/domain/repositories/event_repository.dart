import '../entity/event_details.dart';
import '../entity/trending_event.dart';
import '../entity/upcoming_event.dart';

abstract class EventRepository {
  Future<List<TrendingEvent>> getTrendingEvents();

  Future<List<UpcomingEvent>> getUpcomingEvents();

  Future<EventDetails> getEventDetailsByIndex(int index);
}
