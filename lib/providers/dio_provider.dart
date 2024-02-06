import 'package:dio/dio.dart';

// ignore: non_constant_identifier_names
Dio DioProvider() {
  final Dio dio = Dio();
  dio.interceptors.add(
    InterceptorsWrapper(
      onError: (error, handler) {
        // ignore: avoid_print
        print('Dio Error: $error');
        return handler.next(error);
      },
    ),
  );
  return dio;
}
