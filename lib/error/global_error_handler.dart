import 'dart:async';

class GlobalErrorHandler {
  static final GlobalErrorHandler _instance = GlobalErrorHandler._internal();
  factory GlobalErrorHandler() => _instance;
  GlobalErrorHandler._internal();

  final _errorStreamController = StreamController<String>();

  Stream<String> get errors => _errorStreamController.stream;

  void handle(dynamic error, StackTrace? stackTrace) {
    // print('Error: $error');
    // print('StackTrace: $stackTrace');
    _errorStreamController.add(error.toString());
    // FirebaseCrashlytics.instance.recordError(error, stackTrace);
  }

  void dispose() {
    _errorStreamController.close();
  }
}
