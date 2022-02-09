import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

@freezed
class Event with _$Event {
  factory Event({
    @Default("Unknown") String name,
    @Default("https://picsum.photos/id/237/200/300") String imageUrl,
    @Default(0) int price,
    DateTime? time,
    @Default("") String address,
    @Default(false) bool isSaved,
    @Default(false) bool isTop,
  }) = _Event;
}
