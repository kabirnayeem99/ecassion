import 'package:ecassion/data/dto/mapper/category_dot_to_category.dart';

import '../../domain/entity/category.dart';
import '../../domain/repositories/category_repository.dart';
import '../data_sources/category_local_data_source.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryLocalDataSource _categoryDataSource;

  CategoryRepositoryImpl(this._categoryDataSource);

  @override
  Future<List<Category>> getCategoryList() async {
    final categoryDtoList = await _categoryDataSource.getCategoryList();
    final categories = categoryDtoList
        .map((dto) => CategoryParsing(dto).mapToCategory())
        .toList(growable: false);
    return Future.value(categories);
  }
}
