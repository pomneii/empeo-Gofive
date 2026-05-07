abstract class NameState {}

class NameInitial extends NameState {}

class NameLoaded extends NameState {
  final List<Map<String, String>> results;

  NameLoaded(this.results);
}