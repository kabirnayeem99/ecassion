abstract class SearchRepository {
  List<Object> searchEventByCity(String city);

  List<Object> searchEventByQuery(String query);

  List<Object> searchEventByInterest(String interest);
}
