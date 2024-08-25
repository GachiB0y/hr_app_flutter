import 'dart:async';

class AsyncMutex {
  Completer<void>? _completer;

  /// locks the mutex
  Future<void> lock() async {
    // wait until the mutex return future
    while (_completer != null) {
      await _completer!.future;
    }
    // if completer is null, create completer
    _completer = Completer<void>();
  }

  /// unlocks the mutex
  Future<void> unlock() async {
    // if completer is null, return assert
    assert(_completer != null);

    final completer = _completer!;
    // clear completer
    _completer = null;
    // complete completer
    completer.complete();
  }
}
