import 'package:dartz/dartz.dart';
import 'package:reading_api_data/core/error/failure.dart';

typedef HttpResult<T> = Future<Either<Failure, T>>;
