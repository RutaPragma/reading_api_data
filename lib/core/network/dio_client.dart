import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:reading_api_data/core/error/failure.dart';
import 'package:reading_api_data/core/network/network.dart';

class DioClient implements HttpClient {
  DioClient({required this.baseUrl, Dio? dio})
    : _dio = dio ?? Dio(BaseOptions(baseUrl: baseUrl));

  final String baseUrl;
  final Dio _dio;

  @override
  HttpResult<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return Right(response.data as T);
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  HttpResult<T> post<T>(String path, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.post(path, data: data);
      return Right(response.data as T);
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  HttpResult<T> put<T>(String path, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.put(path, data: data);
      return Right(response.data as T);
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  HttpResult<T> delete<T>(String path, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.delete(path, data: data);
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
      return const NetworkFailure('Tiempo de conexión agotado');
    }
    if (e.response != null) {
      return ServerFailure(
        e.response?.statusMessage ?? 'Error del servidor',
        code: e.response?.statusCode,
      );
    }
    return UnknownFailure('Error inesperado: ${e.message}');
  }
}
