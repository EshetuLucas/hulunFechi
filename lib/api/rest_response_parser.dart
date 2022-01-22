import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:hulunfechi/api/dio_exceptions.dart';
import 'package:hulunfechi/api/post_apis.dart';
import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/datamodels/app_data_model.dart';
import 'package:hulunfechi/datamodels/comment/comment_model.dart';
import 'package:hulunfechi/datamodels/post/post_model.dart';
import 'package:hulunfechi/datamodels/user/user_model.dart';
import 'package:hulunfechi/services/user_service.dart';
import 'package:requests/requests.dart';
import 'package:dio/dio.dart';

/// A parser that contains helper functions for turning your graphQL response into domain specific models
class RestResponseParser {
  final log = getLogger('RestResponseParser');
  final _userService = locator<UserService>();
  var dio = Dio();

  /// Runs a rest query and parses the response with the assumption that it will return a
  /// list of single information.

  Future<List<T>> runRestRequest<T>(
      {required String url, required String key}) async {
    log.v('query:$url');
    var response = await Requests.get(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Bearer ${_userService.currentUser.accessToken}"
      },
    );

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

  Future<void> runDeleteRestRequest({
    required String url,
  }) async {
    log.v('query:$url');
    var response;
    try {
      var response = await dio.delete(
        url,
        options: Options(headers: {
          HttpHeaders.authorizationHeader:
              "Bearer ${_userService.currentUser.accessToken}"
        }),
      );
      log.v('response:$response');
      return;
    } on DioError catch (e) {
      log.e(e);
      return Future.error(DioExceptions().getExceptionMessage(e));
    } catch (e) {
      return Future.error('Something went wrong. Try Again');
    }
  }

  Future<T> runPutRestRequest<T>(
      {required String url,
      required Map<String, dynamic> body,
      required String key}) async {
    log.v('query:$url');
    var response;
    try {
      var response = await dio.put(
        url,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader:
              "Bearer ${_userService.currentUser.accessToken}"
        }),
        data: jsonEncode(body),
      );
      log.v('response:$response');
      return parseUserData<T>(response.data, key: key);
    } on DioError catch (e) {
      log.e(e);
      return Future.error(DioExceptions().getExceptionMessage(e));
    } catch (e) {
      return Future.error('Something went wrong. Try Again');
    }
  }

  Future<T> runPostRestRequest<T>(
      {required String url,
      required Map<String, dynamic> body,
      required String key}) async {
    log.v('query:$url');
    log.d(jsonEncode(body));
    var response;
    try {
      var response = await dio.post(
        url,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader:
              "Bearer ${_userService.currentUser.accessToken}"
        }),
        data: jsonEncode(body),
      );
      log.v('response:$response');
      return parseUserData<T>(response.data, key: key);
    } on DioError catch (e) {
      return Future.error(DioExceptions().getExceptionMessage(e));
    } catch (e) {
      return Future.error('Something went wrong. Try Again');
    }
  }

  //TODO: REMOVE THIS WHEN THE SIGNUP API RETURNS USER OBJECT
  Future<T> runUserSignUpRestRequest<T>(
      {required String url,
      required Map<String, dynamic> body,
      required String key}) async {
    log.v('query:$url');
    log.v(T);
    var response;
    try {
      var response = await dio.post(
        url,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: jsonEncode(body),
      );
      log.v('response:$response');
      if (response.data['message'] == 'User registered successfully!') {
        response = await dio.post(
          login,
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }),
          data: jsonEncode(
              {"username": body['email'], "password": body['password']}),
        );
      } else {
        log.e(response.data['message']);
        throw Future.error(
          (response.data['message']),
        );
      }
      log.v('response:$response');
      return parseUserData<T>(response.data, key: key);
    } on DioError catch (e) {
      return Future.error(DioExceptions().getExceptionMessage(e));
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<T> runUserRestRequest<T>(
      {required String url,
      required Map<String, dynamic> body,
      required String key}) async {
    log.v('query:$url');
    log.v(T);
    var response;
    try {
      var response = await dio.post(
        url,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: jsonEncode(body),
      );
      log.v('response:$response');
      return parseUserData<T>(response.data, key: key);
    } on DioError catch (e) {
      return Future.error(DioExceptions().getExceptionMessage(e));
    } catch (e) {
      return Future.error('Something went wrong. Try Again');
    }
  }

  /// Takes in a raw response and parses it into a list of results of [T]
  List<T> parseData<T>(data, {required String key}) {
    var edges;
    if (key == null)
      edges = data;
    else
      edges = data;
    List<T> results = [];
    for (var edge in edges) {
      results.add(setType<T>(edge, key: key));
    }
    return results;
  }

  T parseUserData<T>(data, {required String key}) {
    return setType(data, key: key);
  }

  setType<T>(var edge, {required String key}) {
    switch (key) {
      case "UserForm":
        log.v('UserForm');
        return edge = User.fromJson(edge);
      case "Posts":
        log.v('Post model');
        return edge = Post.fromJson(edge);
      case "Category":
        log.v('Category model');
        return edge = Category.fromJson(edge);
      case "SubCategory":
        log.v('SubCategory model');
        return edge = SubCategory.fromJson(edge);
      case "Platform":
        log.v('Platform model');
        return edge = Platform.fromJson(edge);
      case "Sector":
        log.v('Sector model');
        return edge = Sector.fromJson(edge);
      case "PostComment":
        return edge = PostComment.fromJson(edge);

      default:
        log.d(T);
    }
  }
}
