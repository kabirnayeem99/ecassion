abstract class CheckoutPageBlocEvent {}

class CheckoutPageInitialLoadEvent extends CheckoutPageBlocEvent {
  final int index;

  CheckoutPageInitialLoadEvent(this.index);
}
