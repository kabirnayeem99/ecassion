import 'package:freezed_annotation/freezed_annotation.dart';
part 'upcoming_event.freezed.dart';


@freezed
class UpcomingEvent with _$UpcomingEvent {
  factory UpcomingEvent({
    @Default("Unknown") String name,
    @Default("https://picsum.photos/id/237/200/300") String imageUrl,
    @Default("") String address,
    @Default(false) bool isSaved,
  }) = _UpcomingEvent;
}
