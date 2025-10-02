import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:reading_api_data/core/config/app_config.dart';
import 'package:reading_api_data/core/enum/defautl_error.dart';
import 'package:reading_api_data/core/error/failure.dart';
import 'package:reading_api_data/core/network/network.dart';

class DioClient implements HttpClient {
  DioClient({Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: AppConfig.envConfig.baseUrl,
              connectTimeout: Duration(
                seconds: AppConfig.envConfig.connectTimeout,
              ),
              receiveTimeout: Duration(
                seconds: AppConfig.envConfig.connectTimeout,
              ),
            ),
          );

  final Dio _dio;

  @override
  HttpResult<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? aditionalHeaders,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: HttpHeaders.aditionalHeaders(aditionalHeaders),
        ),
      );
      return Right(response.data as T);
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  HttpResult<T> post<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? aditionalHeaders,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        options: Options(
          headers: HttpHeaders.aditionalHeaders(aditionalHeaders),
        ),
      );
      return Right(response.data as T);
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  HttpResult<T> put<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? aditionalHeaders,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        options: Options(
          headers: HttpHeaders.aditionalHeaders(aditionalHeaders),
        ),
      );
      return Right(response.data as T);
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  HttpResult<T> delete<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? aditionalHeaders,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        options: Options(
          headers: HttpHeaders.aditionalHeaders(aditionalHeaders),
        ),
      );
      return Right(response.data as T);
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  Failure _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return const NetworkFailure(DefaultError.timeOut);
    }
    if (e.response != null) {
      return ServerFailure(
        e.response?.statusMessage ?? DefaultError.serverError,
        code: e.response?.statusCode,
      );
    }
    return UnknownFailure('${DefaultError.unexpectedError} ${e.message}');
  }
}
