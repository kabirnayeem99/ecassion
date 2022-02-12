import '../entity/category.dart';

abstract class CategoryRepository{
  Future<List<Category>> getCategoryList();
}