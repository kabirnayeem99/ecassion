import 'package:ecassion/data/dto/user_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'event_dto.dart';

part 'event_details_dto.freezed.dart';

@freezed
class EventDetailsDto with _$EventDetailsDto {
  factory EventDetailsDto({
    @Default("Unknown") String name,
    @Default("https://picsum.photos/id/237/200/300") String imageUrl,
    @Default(0) int price,
    DateTime? time,
    @Default("") String address,
    @Default(false) bool isSaved,
    @Default(false) bool isTop,
    @Default([]) List<UserDto> sharedUsers,
    @Default("") String about,
    @Default(0.0) double lat,
    @Default(0.0) double lng,
    @Default(null) UserDto? eventBy,
    @Default([]) List<EventDto> recommendedEvents,
  }) = _EventDetailsDto;
}
