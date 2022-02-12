

import '../../data/repositories/recommendation_repository_impl.dart';
import '../entity/city.dart';
import '../repositories/recommendation_repository.dart';

class GetPopularCities {
  final RecommendationRepository recommendationRepository =
      RecommendationRepositoryImpl();

  Future<List<City>> getCities() {
    return recommendationRepository.getPopularCities();
  }
}
