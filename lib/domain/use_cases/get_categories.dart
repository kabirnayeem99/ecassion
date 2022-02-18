import '../../data/repositories/category_repository_impl.dart';
import '../entity/category.dart';
import '../repositories/category_repository.dart';

class GetCategories {
  final CategoryRepository categoryRepository;

  GetCategories(this.categoryRepository);

  Future<List<Category>> getCategoryList() async {
    return categoryRepository.getCategoryList();
  }
}
