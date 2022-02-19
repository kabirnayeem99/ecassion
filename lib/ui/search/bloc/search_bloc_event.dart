abstract class SearchBlocEvent {}

class SearchBlocInitialLoadingEvent extends SearchBlocEvent {}

class SearchBlocAfterClearLoadingEvent extends SearchBlocEvent {}

class SearchBlocSearchByCityEvent extends SearchBlocEvent {}

class SearchBlocSearchByInterestEvent extends SearchBlocEvent {}

class SearchBlocSearchByQueryEvent extends SearchBlocEvent {
  final String query;

  SearchBlocSearchByQueryEvent(this.query);
}
