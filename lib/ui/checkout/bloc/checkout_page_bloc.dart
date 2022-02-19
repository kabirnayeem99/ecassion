
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

import '../../../domain/use_cases/get_event_details.dart';
import 'checkout_page_bloc_event.dart';
import 'checkout_page_bloc_state.dart';
import 'checkout_page_ui_state.dart';

class CheckoutPageBloc
    extends Bloc<CheckoutPageBlocEvent, CheckoutPageBlocState> {
  final _container = KiwiContainer();
  late GetEventDetails _getEventDetails;

  CheckoutPageBloc(CheckoutPageBlocState initialState) : super(initialState) {
    _setUpUseCases();
    _attachOnEventCall();
  }

  void _attachOnEventCall() {
    on<CheckoutPageInitialLoadEvent>((event, emit) async {
      emit(CheckoutPageBlocLoadingState());
      final _eventDetails =
          await _getEventDetails.getEventDetailsByIndex(event.index);
      final _uiState = CheckoutPageUiState(_eventDetails);
      emit(CheckoutPageBlocSuccessState(_uiState));
    });
  }

  void _setUpUseCases() {
    _getEventDetails = _container.resolve<GetEventDetails>();
  }
}
