import '../entity/event.dart';
import '../repositories/recommendation_repository.dart';

class GetNearbyEvents {
  final RecommendationRepository recommendationRepository;

  GetNearbyEvents(this.recommendationRepository);

  Future<List<Event>> getNearbyEvents() {
    return recommendationRepository.getNearbyEvents();
  }
}
