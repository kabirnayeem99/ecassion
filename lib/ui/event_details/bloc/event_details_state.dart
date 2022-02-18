import 'event_details_ui_state.dart';

abstract class EventDetailsBlocState {}

class EventDetailsBlocLoadingState extends EventDetailsBlocState {}

class EventDetailsBlocErrorState extends EventDetailsBlocState {}

class EventDetailsBlocSuccessState extends EventDetailsBlocState {
  final EventDetailsUiState eventDetailsUiState;

  EventDetailsBlocSuccessState(this.eventDetailsUiState);
}
