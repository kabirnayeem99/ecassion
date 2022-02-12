import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';

@freezed
class Category with _$Category {
  factory Category({
    @Default("") String id,
    @Default("https://picsum.photos/id/237/200/300") String imageUrl,
    @Default("") String name,
  }) = _Category;
}
