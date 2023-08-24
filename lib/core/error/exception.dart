import 'package:tv_movice/core/network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({
    required this.errorMessageModel,
});
}
//هده الطريقه ادا كان من داتابيس مش api
class LocalDatabaseException implements Exception {
  final String message;

  const LocalDatabaseException({
    required this.message,
});
}