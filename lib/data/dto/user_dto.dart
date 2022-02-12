import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';

@freezed
class UserDto with _$UserDto {
  factory UserDto({
    @Default("") String id,
    @Default("https://picsum.photos/id/237/200/300") String imageUrl,
    @Default("") String name,
    @Default("") String email,
    @Default("") String phoneNumber,
  }) = _UserDto;
}
