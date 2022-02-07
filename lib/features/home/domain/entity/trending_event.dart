import 'package:freezed_annotation/freezed_annotation.dart';

part 'trending_event.freezed.dart';

@freezed
class TrendingEvent with _$TrendingEvent {
  factory TrendingEvent({
    @Default("Unknown") String name,
    @Default("https://picsum.photos/id/237/200/300") String imageUrl,
    @Default(0) int price,
    DateTime? time,
    @Default("") String address,
    @Default(false) bool isSaved,
    @Default(false) bool isTop,
  }) = _TrendingEvent;
}
