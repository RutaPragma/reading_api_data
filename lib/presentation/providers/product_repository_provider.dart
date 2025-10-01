import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lectura_datos_api/data/repositories/products_repository_impl.dart';
import 'package:lectura_datos_api/domain/repositories/products_repository.dart';
import 'package:lectura_datos_api/presentation/providers/product_remote_data_source_provider.dart';

final productsRepositoryProvider = Provider<ProductsRepository>((ref) {
  final dataSource = ref.watch(productsRemoteDataSourceProvider);
  return ProductsRepositoryImpl(dataSource);
});
