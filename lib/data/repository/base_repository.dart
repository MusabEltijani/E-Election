import 'package:e_election/data/data_exception.dart';

class BaseRepository {
  dynamic throwExceptionByStatusCode(dynamic statusCode, dynamic msg) {
    switch (statusCode) {
      case 400:
        throw BadRequestException(msg);
      case 401:
      case 403:
        throw UnauthorisedException(msg);
      case 404:
        throw NotFoundException(msg);
      case 406:
        throw NotAcceptableException(msg);
      case 500:
      default:
        throw FetchDataException('Error occured while communication with server'
            ' with status code : $statusCode');
    }
  }
}
