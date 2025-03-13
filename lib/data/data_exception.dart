class AppException implements Exception {
  final _message;
  final _prefix;


  AppException([this._message, this._prefix]);

  get message => _message;

  @override
  String toString() {
    return "$_prefix$_message";
  }

}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, "");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised Request: ");
}

class NotFoundException extends AppException {
  NotFoundException([message]) : super(message, "Unauthorised Request: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

class NotAcceptableException extends AppException {
  NotAcceptableException([String? message]) : super(message, "Not Acceptable Exception: ");
}