import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reading_api_data/domain/usecases/get_products_usecase.dart';
import 'package:reading_api_data/presentation/providers/product_repository_provider.dart';

final getProductsUseCaseProvider = Provider<GetProductsUseCase>((ref) {
  final repository = ref.watch(productsRepositoryProvider);
  return GetProductsUseCase(repository);
});
