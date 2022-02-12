
import '../../../domain/entity/category.dart';
import '../category_dto.dart';

extension CategoryParsing on CategoryDto {
  Category mapToCategory() {
    return Category(name: name, imageUrl: imageUrl, id: id);
  }
}
