import 'package:freezed_annotation/freezed_annotation.dart';

part 'city.freezed.dart';

@freezed
class City with _$City {
  factory City({
    @Default("") String id,
    @Default("https://picsum.photos/id/237/200/300") String imageUrl,
    @Default("") String name,
  }) = _City;
}
