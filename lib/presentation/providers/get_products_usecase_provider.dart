import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lectura_datos_api/domain/usecases/get_products_usecase.dart';
import 'package:lectura_datos_api/presentation/providers/product_repository_provider.dart';

final getProductsUseCaseProvider = Provider<GetProductsUseCase>((ref) {
  final repository = ref.watch(productsRepositoryProvider);
  return GetProductsUseCase(repository);
});
