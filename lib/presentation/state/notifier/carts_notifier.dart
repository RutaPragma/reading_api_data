import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:reading_api_data/core/logger/app_logger.dart';
import 'package:reading_api_data/domain/entities/cart_entities/cart.dart';
import 'package:reading_api_data/domain/usecases/cart/get_carts_usecase.dart';
import 'package:reading_api_data/presentation/state/provider/cart/cart_usecase_provider.dart';

class CartsNotifier extends StateNotifier<AsyncValue<List<Cart>>> {
  CartsNotifier({required GetCartsUseCase getCarts})
    : _getCarts = getCarts,
      super(const AsyncValue.loading());

  final GetCartsUseCase _getCarts;

  Future<List<Cart>?> loadAllCarts() async {
    state = const AsyncValue.loading();
    final result = await _getCarts();

    return result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
        AppLogger.error(state.toString());
        return null;
      },
      (carts) {
        state = AsyncValue.data(carts);
        AppLogger.success(
          carts.toString(),
          'loadAllCarts',
          StackTrace.fromString('Lista de carritos de compra'),
        );
        return carts;
      },
    );
  }
}

final cartsNotifierProvider =
    StateNotifierProvider<CartsNotifier, AsyncValue<List<Cart>>>((ref) {
      final getCarts = ref.watch(getCartUseCaseProvider);

      return CartsNotifier(getCarts: getCarts);
    });
