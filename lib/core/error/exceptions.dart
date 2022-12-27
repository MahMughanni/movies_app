import 'package:movies_app/core/network/error_message.dart';

class ServerExceptions implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerExceptions({required this.errorMessageModel});
}

//for localData ..
class LocalDataBaseException implements Exception {
  // final ErrorMessageModel errorMessageModel ;
  final String message;

  LocalDataBaseException(this.message);
}
