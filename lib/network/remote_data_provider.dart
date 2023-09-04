import 'package:dio/dio.dart';
import 'package:insta_graph/consts/consts.dart';

class RemoteDataProvider {
  late final Dio dio;

  static final RemoteDataProvider _singleton = RemoteDataProvider._internal();

  RemoteDataProvider._internal() {
    dio = createDio();
  }

  factory RemoteDataProvider() {
    return _singleton;
  }

  Dio createDio() {
    const timeOutDuration = Duration(seconds: 3600);
    Dio dio = Dio(
      BaseOptions(
        connectTimeout: timeOutDuration,
        receiveTimeout: timeOutDuration,
        baseUrl: Consts.baseUrl,
      ),
    );

    return dio;
  }
}
