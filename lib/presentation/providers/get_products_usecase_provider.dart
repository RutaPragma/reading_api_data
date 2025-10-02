import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reading_api_data/domain/usecases/usecases.dart';
import 'package:reading_api_data/presentation/providers/product_repository_provider.dart';

final getProductsUseCaseProvider = Provider<GetProductsUseCase>((ref) {
  final repository = ref.watch(productsRepositoryProvider);
  return GetProductsUseCase(repository);
});

final getProductByIdUseCaseProvider = Provider<GetProductByIdUseCase>((ref) {
  final repo = ref.watch(productsRepositoryProvider);
  return GetProductByIdUseCase(repo);
});

final createProductUseCaseProvider = Provider<CreateProductUseCase>((ref) {
  final repo = ref.watch(productsRepositoryProvider);
  return CreateProductUseCase(repo);
});
