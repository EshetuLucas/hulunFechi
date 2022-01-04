import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:hulunfechi/api/dio_exceptions.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/datamodels/app_data_model.dart';
import 'package:requests/requests.dart';
import 'package:dio/dio.dart';

/// A parser that contains helper functions for turning your graphQL response into domain specific models
class RestResponseParser {
  final log = getLogger('RestResponseParser');
  var dio = Dio();

  /// Runs a rest query and parses the response with the assumption that it will return a
  /// list of single information.

  Future<List<T>> runRestRequest<T>({required String url, String? key}) async {
    log.v('query:$url');
    var response = await Requests.get(url);

    log.v(
        'RESPONSE: - hasData: ${response.json() != null}  "data:${response.json()}" : '
        '}');

    if (!response.hasError) {
      try {
        return parseData<T>(response.json(), key: key);
      } catch (e, stacktrace) {
        log.e('failed: $e');

        return Future.error("");
      }
    } else {
      return Future.error(response.raiseForStatus());
    }
  }

  Future<T> runUserRestRequest<T>(
      {required String url,
      required Map<String, dynamic> body,
      String? key}) async {
    log.v('query:$url');
    var response;
    try {
      var response = await dio.post(
        url,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: jsonEncode(body),
      );
      return parseUserData<T>(response.data, key: key);
    } on DioError catch (e) {
      return Future.error(DioExceptions().getExceptionMessage(e));
    } catch (e) {
      return Future.error('Something went wrong. Try Again');
    }
  }

  /// Takes in a raw response and parses it into a list of results of [T]
  List<T> parseData<T>(data, {String? key}) {
    var edges;
    if (key == null)
      edges = data;
    else
      edges = data[key];
    List<T> results = [];
    for (var edge in edges) {
      results.add(setType<T>(edge));
    }
    return results;
  }

  T parseUserData<T>(data, {String? key}) {
    return setType(data['user']);
  }

  setType<T>(var edge) {
    switch (T) {
      case Category:
        return edge = Category.fromJson(edge);
      case Event:
        return edge = Event.fromJson(edge);
      case UserAccount:
        return edge = UserAccount.fromJson(edge);

      default:
    }
  }
}
