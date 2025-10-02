import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reading_api_data/data/repositories/users_repository_impl.dart';
import 'package:reading_api_data/domain/repositories/user_repository.dart';
import 'package:reading_api_data/presentation/state/provider/user/user_remote_data_source_provider.dart';

final usersRepositoryProvider = Provider<UserRepository>((ref) {
  final dataSource = ref.watch(userRemoteDataSourceProvider);
  return UserRepositoryImpl(dataSource);
});
