import 'package:ecassion/features/home/data/data_sources/category_local_data_source.dart';
import 'package:ecassion/features/home/data/dto/mapper/category_dot_to_category.dart';
import 'package:ecassion/features/home/domain/repositories/category_repository.dart';

import '../../domain/entity/category.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryLocalDataSource _categoryDataSource = CategoryLocalDataSource();

  @override
  Future<List<Category>> getCategoryList() async {
    final categoryDtoList = await _categoryDataSource.getCategoryList();
    final categories = categoryDtoList
        .map((dto) => CategoryParsing(dto).mapToCategory())
        .toList(growable: false);
    return Future.value(categories);
  }
}
