import '../entity/event_details.dart';

abstract class EventDetailsRepository {
  Future<EventDetails> getEventDetailsByIndex(int index);
}
