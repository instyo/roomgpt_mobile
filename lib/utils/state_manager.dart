import 'package:rxdart/subjects.dart';

abstract class StateManager<T> {
  // Create BehaviorSubject with a default state
  final BehaviorSubject<T> _stateController;

  // Constructor to set the default state
  StateManager(T initialState)
      : _stateController = BehaviorSubject<T>.seeded(initialState);

  // Stream to expose the state
  Stream<T> get stream => _stateController.stream;

  // State
  T get state => _stateController.value;

  // Function to update the state
  void emit(T newState) {
    _stateController.add(newState);
  }

  // Close the stream when the state manager is no longer needed
  void dispose() {
    _stateController.close();
  }
}
