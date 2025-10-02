import 'package:dartz/dartz.dart';
import 'package:reading_api_data/core/network/http_client.dart';
import 'package:reading_api_data/data/data.dart';
import 'package:reading_api_data/data/datasources/user_remote_datasource.dart';
import 'package:reading_api_data/domain/domain.dart';
import 'package:reading_api_data/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remote;

  UserRepositoryImpl(this.remote);

  @override
  HttpResult<List<User>> getUsers() async {
    final result = await remote.getUser();
    return result.fold((failure) => Left(failure), (models) {
      return Right(models.map(UserMapper.toEntity).toList());
    });
  }
}
