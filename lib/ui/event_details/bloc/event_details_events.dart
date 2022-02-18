abstract class EventDetailsBlocEvents {}

class EventDetailsBlocInitialLoadingEvent extends EventDetailsBlocEvents {
  final int index;

  EventDetailsBlocInitialLoadingEvent(this.index);
}
