import 'package:ecassion/domain/repositories/event_repository.dart';

import '../entity/event_details.dart';

class GetEventDetails {
  final EventRepository _eventRepository;

  GetEventDetails(this._eventRepository);

  Future<EventDetails> getEventDetailsByIndex(int index) async {
    return _eventRepository.getEventDetailsByIndex(index);
  }
}
