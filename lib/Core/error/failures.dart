abstract class Failure {
  final List properties;
  Failure([this.properties = const <dynamic>[]]);
}

class MessageFailure extends Failure {
  final String message;

  MessageFailure(this.message);
}
