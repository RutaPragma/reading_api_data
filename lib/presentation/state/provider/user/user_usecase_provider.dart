import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reading_api_data/domain/usecases/usecases.dart';
import 'package:reading_api_data/presentation/state/provider/user/user_repository_provider.dart';

final getUserUseCaseProvider = Provider<GetUsersUseCase>((ref) {
  final repository = ref.watch(usersRepositoryProvider);
  return GetUsersUseCase(repository);
});
