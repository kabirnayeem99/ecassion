import 'package:ecassion/data/dto/event_details_dto.dart';
import 'package:ecassion/data/dto/mapper/event_dto_to_event_mapper.dart';
import 'package:ecassion/domain/entity/event_details.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entity/trending_event.dart';
import '../../domain/entity/upcoming_event.dart';
import '../../domain/repositories/event_repository.dart';
import '../data_sources/event_local_data_source.dart';

class EventRepositoryImpl extends EventRepository {
  final EventLocalDataSource _eventLocalDataSource = EventLocalDataSource();

  @override
  Future<List<TrendingEvent>> getTrendingEvents() async {
    final eventDtoList = await _eventLocalDataSource.getTrendingEvents();
    final trendingEvents = eventDtoList
        .map((dto) => EventParsing(dto).mapToTrendingEvent())
        .toList(growable: false);
    return trendingEvents;
  }

  @override
  Future<List<UpcomingEvent>> getUpcomingEvents() async {
    final eventDtoList = await _eventLocalDataSource.getUpcomingEvents();
    final upcomingEvents = eventDtoList
        .map((dto) => EventParsing(dto).mapToUpcomingEvent())
        .toList(growable: false);
    return upcomingEvents;
  }

  @override
  Future<EventDetails> getEventDetailsByIndex(int index) async {
    final eventDetailsDto =
        await compute(_eventLocalDataSource.getEventDetailsByIndex, index);
    final event = compute(getEventDetailsFromEventDto, eventDetailsDto);
    return event;
  }

  EventDetails getEventDetailsFromEventDto(EventDetailsDto eventDetailsDto) {
    return EventDetailsParsing(eventDetailsDto).mapToEventDetails();
  }
}
