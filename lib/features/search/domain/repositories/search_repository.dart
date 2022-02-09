import 'package:ecassion/features/search/domain/entity/city.dart';
import 'package:ecassion/features/search/domain/entity/event.dart';
import 'package:ecassion/features/search/domain/entity/interest.dart';

abstract class SearchRepository {
  Future<List<Event>> searchEventByCity(City city);

  Future<List<Event>> searchEventByQuery(String query);

  Future<List<Event>> searchEventByInterest(Interest interest);
}
