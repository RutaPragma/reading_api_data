import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lectura_datos_api/domain/entities/product.dart' show Product;
import 'package:lectura_datos_api/presentation/providers/get_products_usecase_provider.dart';

class ProductsNotifier extends AsyncNotifier<List<Product>> {
  @override
  Future<List<Product>> build() async {
    return await fetchProducts();
  }

  Future<List<Product>> fetchProducts() async {
    final getProductsUseCase = ref.read(getProductsUseCaseProvider);
    final result = await getProductsUseCase();

    return result.fold(
      (failure) => throw Exception(failure.message),
      (products) => products,
    );
  }
}

final productsNotifierProvider =
    AsyncNotifierProvider<ProductsNotifier, List<Product>>(() {
      return ProductsNotifier();
    });
