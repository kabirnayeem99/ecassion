import 'package:freezed_annotation/freezed_annotation.dart';

part 'interest.freezed.dart';

@freezed
class Interest with _$Interest {
  factory Interest({
    @Default("") String id,
    @Default("https://picsum.photos/id/237/200/300") String imageUrl,
    @Default("") String name,
  }) = _Interest;
}
