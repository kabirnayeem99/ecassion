import '../entity/interest.dart';
import '../repositories/recommendation_repository.dart';

class GetInterests {
  final RecommendationRepository recommendationRepository;

  GetInterests(this.recommendationRepository);

  Future<List<Interest>> getInterests() {
    return recommendationRepository.getAllInterests();
  }
}
