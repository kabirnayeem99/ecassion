import 'package:ecassion/features/home/domain/repositories/category_repository.dart';

import '../../data/repositories/category_repository_impl.dart';
import '../entity/category.dart';

class GetCategories {
  final CategoryRepository categoryRepository = CategoryRepositoryImpl();

  Future<List<Category>> getCategoryList() async {
    return categoryRepository.getCategoryList();
  }
}
