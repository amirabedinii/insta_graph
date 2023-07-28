import 'dart:io';

import 'package:dio/dio.dart';
import 'package:insta_graph/network/remote_data_provider.dart';


class HttpHelper {
  final Dio _dio = RemoteDataProvider().dio;

  Future<dynamic> _responseData(Response response) async {
    try {
      switch (response.statusCode) {
        case HttpStatus.ok:
          return response;
        case HttpStatus.created:
          return response;
        case HttpStatus.noContent:
          break;
        case HttpStatus.badRequest:
          //TODO: exeption
          break;
        case HttpStatus.unauthorized:
          //TODO: exeption
          break;
        case HttpStatus.forbidden:
          //TODO: exeption
          break;
        case HttpStatus.notFound:
          //TODO: exeption
          break;
        case HttpStatus.tooManyRequests:
          //TODO: exeption
          break;
        default:
          //TODO: exeption
          break;
      }
    } catch (_) {
      //TODO: handling exeptions
    }
  }

  Future<dynamic> httpGet(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return _responseData(
        await _dio.get(
          '/$path',
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
        '/$path',
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
          '/$path',
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
          '/$path',
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
        '/$path',
        data: data,
        options: Options(),
      ));
    } catch (_) {
      //TODO: handel exeption
    }
  }
}
