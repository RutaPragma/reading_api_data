import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reading_api_data/domain/usecases/usecases.dart';
import 'package:reading_api_data/presentation/state/provider/cart/cart_repository_provider.dart';

final getCartUseCaseProvider = Provider<GetCartsUseCase>((ref) {
  final repository = ref.watch(cartRepositoryProvider);
  return GetCartsUseCase(repository);
});
