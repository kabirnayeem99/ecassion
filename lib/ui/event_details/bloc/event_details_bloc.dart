import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

import '../../../domain/entity/event_details.dart';
import '../../../domain/use_cases/get_event_details.dart';
import 'event_details_events.dart';
import 'event_details_state.dart';
import 'event_details_ui_state.dart';

class EventDetailsBloc
    extends Bloc<EventDetailsBlocEvents, EventDetailsBlocState> {
  final _container = KiwiContainer();

  late GetEventDetails _getEventDetails;

  EventDetailsBloc(EventDetailsBlocState initialState) : super(initialState) {
    _setUpUseCases();
    _onInitialLoadingEvent();
  }

  void _onInitialLoadingEvent() {
    on<EventDetailsBlocInitialLoadingEvent>(
      (event, emit) async {
        final EventDetails _eventDetails =
            await _getEventDetails.getEventDetailsByIndex(event.index);

        final EventDetailsUiState successUiState = EventDetailsUiState(
          message: "",
          eventDetails: _eventDetails,
        );

        emit(EventDetailsBlocSuccessState(successUiState));
      },
    );
  }

  void _setUpUseCases() {
    _getEventDetails = _container.resolve<GetEventDetails>();
  }
}
