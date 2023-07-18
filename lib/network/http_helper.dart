import 'dart:io';

import 'package:dio/dio.dart';
import 'package:insta_graph/consts/consts.dart';

class HttpHelper {
  final Dio _dio = Dio(BaseOptions(baseUrl: Consts.baseUrl));

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
    String method, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return _responseData(
        await _dio.get(
          '/$method',
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
    String method, {
    required dynamic data,
  }) async {
    try {
      return _responseData(await _dio.post(
        '/$method',
        data: data,
      ));
    } on DioException catch (e) {
      return _responseData(e.response!);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> httpPut(
    String method, {
    required dynamic data,
  }) async {
    try {
      return _responseData(
        await _dio.put(
          '/$method',
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
    String method, {
    required dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return _responseData(
        await _dio.delete(
          '/$method',
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
    String method, {
    Map<String, dynamic>? queryParameters,
    required dynamic data,
  }) async {
    try {
      return _responseData(await _dio.post(
        '/$method',
        data: data,
        options: Options(),
      ));
    } catch (_) {
      //TODO: handel exeption
    }
  }
}
