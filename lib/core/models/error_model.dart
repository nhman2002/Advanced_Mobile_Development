class ErrorModel {
  final int? statusCode;
  final String? message;
  final int? internalCode;

  ErrorModel({
    this.statusCode,
    this.message,
    this.internalCode,
  });

  ErrorModel copyWith({
    int? statusCode,
    String? message,
    int? internalCode,
  }) =>
      ErrorModel(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        internalCode: internalCode ?? this.internalCode,
      );

  ErrorModel.fromJson(Map<String, dynamic> json) :
    statusCode = json['statusCode'] as int?,
    message = json['message'] as String?,
    internalCode = json['internalCode'] as int?;
}