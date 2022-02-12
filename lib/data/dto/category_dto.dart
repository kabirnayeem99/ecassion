import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_dto.freezed.dart';

@freezed
class CategoryDto with _$CategoryDto {
  factory CategoryDto({
    @Default("") String id,
    @Default("https://picsum.photos/id/237/200/300") String imageUrl,
    @Default("") String name,
  }) = _CategoryDto;
}