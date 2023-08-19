import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:insta_graph/network/exceptions.dart';
import 'package:insta_graph/network/remote_data_provider.dart';

class HttpHelper {
  final Dio _dio = RemoteDataProvider().dio;
  final String baseUrl = "http://37.32.6.196:8000/";

  Future<dynamic> _responseData(Response response) async {
    try {
      switch (response.statusCode) {
        case HttpStatus.ok:
          return response;
        case HttpStatus.created:
          return response;
        case HttpStatus.noContent:
          break;
       case HttpStatus.noContent:
          break;
        // 400
        case HttpStatus.badRequest:
          throw BadRequestException(
            response.requestOptions.path,
            jsonDecode(jsonEncode(response.data)),
            response.data['error'],
            response.data['message'],
          );
        // 401
        case HttpStatus.unauthorized:
          throw UnauthorizedException(
            response.requestOptions.path,
            response.data['error'] ?? 'authorization_forbidden',
            response.data['message'],
          );
        // 403
        case HttpStatus.forbidden:
          throw ForbiddenException(
            response.requestOptions.path,
            response.data['error'] ?? 'forbidden_exception',
            response.data['message'],
          );
        // 404
        case HttpStatus.notFound:
          throw NotFoundException(
            response.requestOptions.path,
            response.data['error'] ?? 'This Uri Not Founded',
            response.data['message'],
          );
        //
        case HttpStatus.unprocessableEntity:
          throw BadRequestException(
            response.requestOptions.path,
            jsonDecode(jsonEncode(response.data)),
            response.data['error'],
            response.data['message'],
          );
        // 429
        case HttpStatus.tooManyRequests:
          throw TooManyRequestException(
            response.requestOptions.path,
            'Too Many Request',
            response.data['message'],
          );
        // 500
        case HttpStatus.internalServerError:
          throw ServerException(
            response.requestOptions.path,
            'server_exception',
            response.data['message'],
          );
        // Others
        default:
          throw NotHandleException(
            response.requestOptions.path,
            'This Status Code Not Handled',
            response.data['message'],
          );
      }
    } on JsonUnsupportedObjectError {
      throw ServerException(
        response.requestOptions.path,
        'Server Unsupported Json Object',
        response.data['message'],
      );
    } on FormatException {
      throw ServerException(
        response.requestOptions.path,
        'Server Unsupported Json Format',
        response.data['message'],
      );
    }
      
  }

  Future<dynamic> httpGet(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return _responseData(
        await _dio.get(
          baseUrl + path,
          queryParameters: queryParameters,
        ),
      );
    } on DioException catch (e) {
      return _responseData(e.response!);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> httpPost(
    String path, {
    required dynamic data,
  }) async {
    try {
      return _responseData(await _dio.post(
       baseUrl + path,
        data: data,
      ));
    } on DioException catch (e) {
      return _responseData(e.response!);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> httpPut(
    String path, {
    required dynamic data,
  }) async {
    try {
      return _responseData(
        await _dio.put(
          baseUrl + path,
          data: data,
        ),
      );
    } on DioException catch (e) {
      return _responseData(e.response!);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> httpDelete(
    String path, {
    required dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return _responseData(
        await _dio.delete(
        baseUrl + path,
          data: data,
        ),
      );
    } on DioException catch (e) {
      return _responseData(e.response!);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> httpPatch(
    String path, {
    Map<String, dynamic>? queryParameters,
    required dynamic data,
  }) async {
    try {
      return _responseData(await _dio.post(
        baseUrl + path,
        data: data,
        options: Options(),
      ));
    } catch (_) {
      //TODO: handel exeption
    }
  }
}
