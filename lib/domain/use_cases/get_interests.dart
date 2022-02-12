import '../../data/repositories/recommendation_repository_impl.dart';
import '../entity/interest.dart';
import '../repositories/recommendation_repository.dart';

class GetInterests {
  final RecommendationRepository recommendationRepository =
      RecommendationRepositoryImpl();

  Future<List<Interest>> getInterests() {
    return recommendationRepository.getAllInterests();
  }
}
