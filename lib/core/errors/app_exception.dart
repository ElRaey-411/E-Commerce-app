abstract class AppException implements Exception {
  final String exception;
  AppException({required this.exception});
}

class RemoteException extends AppException {
  RemoteException({required super.exception}) ;
}

class LocalException extends AppException {
  LocalException({required super.exception,}) ;
}
