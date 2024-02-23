import 'package:roomgpt_mobile/utils/state_status.dart';

abstract class BaseState {
  final StateStatus status;
  final String errorMessage;

  const BaseState({
    required this.status,
    required this.errorMessage,
  });

  BaseState copyWith({
    StateStatus? status,
    String? errorMessage,
  });
}

class Optional<T> {
  final T value;
  const Optional.value(this.value);
}
