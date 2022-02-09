import 'package:ecassion/features/home/data/dto/category_dto.dart';
import 'package:ecassion/features/home/domain/entity/category.dart';

extension CategoryParsing on CategoryDto {
  Category mapToCategory() {
    return Category(name: name, imageUrl: imageUrl, id: id);
  }
}
