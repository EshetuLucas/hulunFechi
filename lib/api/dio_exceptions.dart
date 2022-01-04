import 'package:dio/dio.dart';

class DioExceptions {
  // This function will parse the dio exception and retruns exception string accordingly
  // We should add more exception handling methods like returning, exception methods base on error code.
  // We can't use response package right now because the owners did not moved the package to the null safty right now
  // We need to test this as we go deploy the new apk.
  String getExceptionMessage(DioError e) {
    if (e.type == DioErrorType.response) {
      print('catched');
      return e.response?.data ?? '';
    } else if (e.type == DioErrorType.connectTimeout) {
      print('check your connection');
      return 'Check your connection';
    } else if (e.type == DioErrorType.receiveTimeout) {
      print('unable to connect to the server');
      return 'Unable to connect to the server. Try Again';
    } else {
      print('Something went wrong');
      return 'Something went wrong. Try Again';
    }
  }

  int checkMiddleElement(var array) {
    int arrayLength = array.length;
    if (array.isEmpty) {
      return 0;
    } else if (arrayLength == 1) {
      return 1;
    } else if (arrayLength % 2 == 0) {
      return 0;
    } else {
      int middleIndex = arrayLength / 2 as int;
      int middleElement = array[arrayLength / 2 as int];
      for (int i = 0; i < arrayLength; i++) {
        int element = array[i];
        if (i == middleIndex) {
          continue;
        } else if (element < middleElement) {
          return 0;
        }
      }
      return 1;
    }
  }
}
