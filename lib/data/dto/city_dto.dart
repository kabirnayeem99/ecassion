import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_dto.freezed.dart';

@freezed
class CityDto with _$CityDto {
  factory CityDto({
    @Default("") String id,
    @Default("https://picsum.photos/id/237/200/300") String imageUrl,
    @Default("") String name,
  }) = _CityDto;
}