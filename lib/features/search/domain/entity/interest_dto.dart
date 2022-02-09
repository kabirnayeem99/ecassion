import 'package:freezed_annotation/freezed_annotation.dart';

part 'interest_dto.freezed.dart';

@freezed
class InterestDto with _$InterestDto {
  factory InterestDto({
    @Default("") String id,
    @Default("https://picsum.photos/id/237/200/300") String imageUrl,
    @Default("") String name,
  }) = _InterestDto;
}
