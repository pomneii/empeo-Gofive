abstract class NameEvent {}

class SearchNameEvent extends NameEvent {
  final String query;

  SearchNameEvent(this.query);
}