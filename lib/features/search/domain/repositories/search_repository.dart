import 'package:ecassion/features/search/domain/entity/city.dart';
import 'package:ecassion/features/search/domain/entity/event.dart';
import 'package:ecassion/features/search/domain/entity/interest.dart';

abstract class SearchRepository {
  List<Event> searchEventByCity(City city);

  List<Event> searchEventByQuery(String query);

  List<Event> searchEventByInterest(Interest interest);
}
