import 'package:ecassion/features/home/data/data_sources/event_local_data_source.dart';
import 'package:ecassion/features/home/data/dto/mapper/event_to_trending_event.dart';
import 'package:ecassion/features/home/domain/entity/trending_event.dart';
import 'package:ecassion/features/home/domain/repositories/event_repository.dart';

import '../../domain/entity/upcoming_event.dart';

class EventRepositoryImpl extends EventRepository {
  final eventLocalDataSource = EventLocalDataSource();

  @override
  Future<List<TrendingEvent>> getTrendingEvents() async {
    final eventDtoList = await eventLocalDataSource.getTrendingEvents();
    final trendingEvents = eventDtoList
        .map((dto) => EventParsing(dto).mapToTrendingEvent())
        .toList(growable: false);
    return trendingEvents;
  }

  @override
  Future<List<UpcomingEvent>> getUpcomingEvents() async {
    final eventDtoList = await eventLocalDataSource.getTrendingEvents();
    final upcomingEvents = eventDtoList
        .map((dto) => EventParsing(dto).mapToUpcomingEvent())
        .toList(growable: false);
    return upcomingEvents;
  }
}
