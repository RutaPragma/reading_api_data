import 'package:reading_api_data/core/error/failure.dart';

import 'package:dartz/dartz.dart';

typedef HttpResult<T> = Future<Either<Failure, T>>;

abstract class HttpClient {
  HttpResult<T> get<T>(String path, {Map<String, dynamic>? queryParameters});
  HttpResult<T> post<T>(String path, {Map<String, dynamic>? data});
  HttpResult<T> put<T>(String path, {Map<String, dynamic>? data});
  HttpResult<T> delete<T>(String path, {Map<String, dynamic>? data});
}
