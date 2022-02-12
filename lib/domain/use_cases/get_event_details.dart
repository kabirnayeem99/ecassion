import 'package:ecassion/data/repositories/event_repository_impl.dart';
import 'package:ecassion/domain/repositories/event_repository.dart';

import '../entity/event_details.dart';

class GetEventDetails {
  final EventRepository _eventRepository = EventRepositoryImpl();

  Future<EventDetails> getEventDetailsByIndex(int index) async {
    return _eventRepository.getEventDetailsByIndex(index);
  }
}
