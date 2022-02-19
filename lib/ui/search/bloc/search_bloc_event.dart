import 'package:ecassion/domain/entity/interest.dart';

import '../../../domain/entity/city.dart';

abstract class SearchBlocEvent {}

class SearchBlocInitialLoadingEvent extends SearchBlocEvent {}

class SearchBlocAfterClearLoadingEvent extends SearchBlocEvent {}

class SearchBlocSearchByCityEvent extends SearchBlocEvent {
  final City city;

  SearchBlocSearchByCityEvent({required this.city});
}

class SearchBlocSearchByInterestEvent extends SearchBlocEvent {
  final Interest interest;

  SearchBlocSearchByInterestEvent({required this.interest});
}

class SearchBlocSearchByQueryEvent extends SearchBlocEvent {
  final String query;

  SearchBlocSearchByQueryEvent(this.query);
}
