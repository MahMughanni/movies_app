class ErrorMessageModel {
  final int statusCode;
  final String statusMessage;
  final bool success;

  const ErrorMessageModel({
    required this.statusCode,
    required this.statusMessage,
    required this.success,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> fromJson) =>
      ErrorMessageModel(
        statusCode: fromJson['status_code'],
        statusMessage: fromJson['status_message'],
        success: fromJson['success'],
      );
}
