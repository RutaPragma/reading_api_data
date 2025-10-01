import 'package:dartz/dartz.dart';
import 'package:lectura_datos_api/core/error/failure.dart';

typedef HttpResult<T> = Future<Either<Failure, T>>;
