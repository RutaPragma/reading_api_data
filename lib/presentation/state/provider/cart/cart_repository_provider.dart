import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reading_api_data/data/repositories/carts_repository_impl.dart';
import 'package:reading_api_data/domain/repositories/cart_repository.dart';
import 'package:reading_api_data/presentation/state/provider/cart/cart_remote_data_source_provider.dart';

final cartRepositoryProvider = Provider<CartRepository>((ref) {
  final dataSource = ref.watch(cartRemoteDataSourceProvider);
  return CartRepositoryImpl(dataSource);
});
