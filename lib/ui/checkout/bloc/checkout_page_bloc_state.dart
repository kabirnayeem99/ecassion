import 'checkout_page_ui_state.dart';

abstract class CheckoutPageBlocState {}

class CheckoutPageBlocLoadingState extends CheckoutPageBlocState {}

class CheckoutPageBlocErrorState extends CheckoutPageBlocState {
  final String errorMessage;

  CheckoutPageBlocErrorState(this.errorMessage);
}

class CheckoutPageBlocSuccessState extends CheckoutPageBlocState {
  final CheckoutPageUiState uiState;

  CheckoutPageBlocSuccessState(this.uiState);
}
