import 'package:reading_api_data/core/error/failure.dart';
import 'package:reading_api_data/core/network/network.dart';
import 'package:reading_api_data/data/data.dart';

import 'package:dartz/dartz.dart';

abstract class UserRemoteDataSource {
  HttpResult<List<UserModel>> getUser();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  UserRemoteDataSourceImpl(this.client);
  final HttpClient client;
  final String userPath = '/users';

  @override
  HttpResult<List<UserModel>> getUser() async {
    final result = await client.get<List<dynamic>>(userPath);

    return result.fold((failure) => Left(failure), (data) {
      try {
        final users = data.map((e) => UserMapper.fromMap(e)).toList();
        return Right(users);
      } catch (e) {
        return Left(
          UnknownFailure(
            'Error parseando usuarios <UserRemoteDataSourceImpl><getUser>: $e',
          ),
        );
      }
    });
  }
}
