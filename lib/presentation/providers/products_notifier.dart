import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:reading_api_data/core/logger/app_logger.dart';
import 'package:reading_api_data/domain/entities/product.dart' show Product;

import 'package:reading_api_data/domain/entities/product.dart';
import 'package:reading_api_data/domain/usecases/usecases.dart';
import 'package:reading_api_data/presentation/providers/get_products_usecase_provider.dart';

class ProductsNotifier extends StateNotifier<AsyncValue<List<Product>>> {
  ProductsNotifier({
    required GetProductsUseCase getProducts,
    required GetProductByIdUseCase getProductById,
    required CreateProductUseCase createProduct,
  }) : _getProducts = getProducts,
       _getProductById = getProductById,
       _createProduct = createProduct,
       super(const AsyncValue.loading());

  final GetProductsUseCase _getProducts;
  final GetProductByIdUseCase _getProductById;
  final CreateProductUseCase _createProduct;

  Future<List<Product>?> loadAllProducts() async {
    state = const AsyncValue.loading();
    final result = await _getProducts();

    return result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
        AppLogger.error(state.toString());
        return null;
      },
      (products) {
        state = AsyncValue.data(products);
        AppLogger.success(products.toString());
        return products;
      },
    );
  }

  Future<Product?> loadProductById(int id) async {
    final result = await _getProductById(id);
    return result.fold(
      (failure) {
        AppLogger.error(failure.message);
        state = AsyncValue.error(failure, StackTrace.current);
        return null;
      },
      (product) {
        AppLogger.success(product.toString());
        AsyncValue.data(product);
        return product;
      },
    );
  }

  Future<void> createProduct({int productId = 0}) async {
    final Map<String, dynamic> product = {
      'id': productId,
      'title': 'JR product name',
      'price': 0.1,
      'description': 'Nuevo producto',
      'category': 'jewelery',
      'image':
          'https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_t.png',
      'rating': {'rice': 3.9, 'count': 120},
    };

    final result = await _createProduct(product);
    result.fold(
      (failure) {
        state = AsyncValue.error(failure.message, StackTrace.current);
        AppLogger.error(state.error.toString());
      },

      (product) {
        AppLogger.success(product.toString());
      },
    );
  }
}

final productsNotifierProvider =
    StateNotifierProvider<ProductsNotifier, AsyncValue<List<Product>>>((ref) {
      final getProducts = ref.watch(getProductsUseCaseProvider);
      final getProductById = ref.watch(getProductByIdUseCaseProvider);
      final createProduct = ref.watch(createProductUseCaseProvider);

      return ProductsNotifier(
        getProducts: getProducts,
        getProductById: getProductById,
        createProduct: createProduct,
      );
    });

final counterProvider = StateProvider((ref) => 1);
final loadingProvider = StateProvider((ref) => false);
final contentProvider = StateProvider((ref) => []);
