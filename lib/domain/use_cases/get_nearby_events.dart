import '../../data/repositories/recommendation_repository_impl.dart';
import '../entity/event.dart';
import '../repositories/recommendation_repository.dart';

class GetNearbyEvents {
  final RecommendationRepository recommendationRepository =
      RecommendationRepositoryImpl();

  Future<List<Event>> getNearbyEvents() {
    return recommendationRepository.getNearbyEvents();
  }
}
