import 'package:ecassion/features/search/data/repositories/recommendation_repository_impl.dart';
import 'package:ecassion/features/search/domain/entity/city.dart';
import 'package:ecassion/features/search/domain/repositories/recommendation_repository.dart';

class GetPopularCities {
  final RecommendationRepository recommendationRepository =
      RecommendationRepositoryImpl();

  Future<List<City>> getCities() {
    return recommendationRepository.getPopularCities();
  }
}
