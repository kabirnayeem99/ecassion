import 'package:ecassion/features/home/data/dto/event_dto.dart';
import 'package:ecassion/features/home/domain/entity/trending_event.dart';
import 'package:ecassion/features/home/domain/entity/upcoming_event.dart';

extension EventParsing on EventDto {
  TrendingEvent mapToTrendingEvent() {
    return TrendingEvent(
      name: name,
      imageUrl: imageUrl,
      price: price,
      time: time,
      address: address,
      isSaved: isSaved,
      isTop: isTop,
    );
  }

  UpcomingEvent mapToUpcomingEvent() {
    return UpcomingEvent(
      name: name,
      imageUrl: imageUrl,
      address: address,
      isSaved: isSaved,
    );
  }
}
