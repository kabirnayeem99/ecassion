import 'package:ecassion/data/data_sources/search_local_data_source.dart';
import 'package:ecassion/data/dto/event_dto.dart';
import 'package:ecassion/data/dto/mapper/event_dto_to_event_mapper.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entity/city.dart';
import '../../domain/entity/event.dart';
import '../../domain/entity/interest.dart';
import '../../domain/repositories/search_repository.dart';

class SearchRepositoryImpl extends SearchRepository {
  SearchLocalDataSource _searchLocalDataSource;

  SearchRepositoryImpl(this._searchLocalDataSource);

  @override
  Future<List<Event>> searchEventByCity(City city) async {
    final List<EventDto> dtoSearchResult =
        await _searchLocalDataSource.searchEventByQuery(city.name);

    final List<Event> events =
        await compute(_convertDtosToEvents, dtoSearchResult);

    return events;
  }

  @override
  Future<List<Event>> searchEventByInterest(Interest interest) async {
    final List<EventDto> dtoSearchResult =
        await _searchLocalDataSource.searchEventByQuery(interest.name);

    final List<Event> events =
        await compute(_convertDtosToEvents, dtoSearchResult);

    return events;
  }

  @override
  Future<List<Event>> searchEventByQuery(String query) async {
    final List<EventDto> dtoSearchResult =
        await _searchLocalDataSource.searchEventByQuery(query);

    final List<Event> events =
        await compute(_convertDtosToEvents, dtoSearchResult);

    return events;
  }

  List<Event> _convertDtosToEvents(List<EventDto> dtos) {
    final events = dtos
        .map((dto) => EventParsing(dto).mapToEvent())
        .toList(growable: false);
    return events;
  }
}
