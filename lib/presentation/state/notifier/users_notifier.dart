import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:reading_api_data/core/logger/app_logger.dart';
import 'package:reading_api_data/domain/entities/user_entities/user.dart';
import 'package:reading_api_data/domain/usecases/user/get_users_usecase.dart';
import 'package:reading_api_data/presentation/state/provider/user/user_usecase_provider.dart';

class UsersNotifier extends StateNotifier<AsyncValue<List<User>>> {
  UsersNotifier({required GetUsersUseCase getUsers})
    : _getUsers = getUsers,
      super(const AsyncValue.loading());

  final GetUsersUseCase _getUsers;

  Future<List<User>?> loadAllUsers() async {
    state = const AsyncValue.loading();
    final result = await _getUsers();

    return result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
        AppLogger.error(state.toString());
        return null;
      },
      (users) {
        state = AsyncValue.data(users);
        AppLogger.success(
          users.toString(),
          'loadAllUsers',
          StackTrace.fromString('Lista de usuarios'),
        );
        return users;
      },
    );
  }
}

final usersNotifierProvider =
    StateNotifierProvider<UsersNotifier, AsyncValue<List<User>>>((ref) {
      final getUsers = ref.watch(getUserUseCaseProvider);

      return UsersNotifier(getUsers: getUsers);
    });
