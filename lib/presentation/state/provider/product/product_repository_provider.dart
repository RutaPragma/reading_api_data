import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reading_api_data/data/repositories/products_repository_impl.dart';
import 'package:reading_api_data/domain/repositories/products_repository.dart';
import 'package:reading_api_data/presentation/state/provider/product/product_remote_data_source_provider.dart';

final productsRepositoryProvider = Provider<ProductsRepository>((ref) {
  final dataSource = ref.watch(productsRemoteDataSourceProvider);
  return ProductsRepositoryImpl(dataSource);
});
