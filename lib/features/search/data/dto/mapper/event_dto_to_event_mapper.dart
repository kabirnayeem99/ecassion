import 'package:ecassion/features/search/data/dto/event_dto.dart';
import 'package:ecassion/features/search/domain/entity/event.dart';

extension EventParsing on EventDto {
  Event mapToEvent() {
    return Event(
      name: name,
      imageUrl: imageUrl,
      price: price,
      time: time,
      address: address,
      isSaved: isSaved,
      isTop: isTop,
    );
  }
}
