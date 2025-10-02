import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reading_api_data/presentation/providers/providers.dart';
import 'package:reading_api_data/presentation/widgets/widgets.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider.notifier);
    final loading = ref.watch(loadingProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Reading data')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 260,
              width: double.infinity,
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                children: [
                  SyncButton(
                    text: 'Get Prod',
                    color: Colors.purpleAccent,
                    onPress: () async {
                      loading.state = !loading.state;
                      final notifier = ref.read(
                        productsNotifierProvider.notifier,
                      );
                      await notifier.loadAllProducts();
                      loading.state = !loading.state;
                    },
                  ),
                  SyncButton(
                    text: 'Get Prod By Id',
                    color: Colors.greenAccent,
                    onPress: () async {
                      loading.state = !loading.state;
                      final notifier = ref.read(
                        productsNotifierProvider.notifier,
                      );
                      await notifier.loadProductById(counter.state);

                      counter.state++;

                      loading.state = !loading.state;
                    },
                    onLongPress: () {
                      counter.state = 1;
                    },
                  ),

                  SyncButton(
                    text: 'Create Prod',
                    color: Colors.redAccent,
                    onPress: () async {
                      loading.state = !loading.state;
                      final notifier = ref.read(
                        productsNotifierProvider.notifier,
                      );
                      await notifier.createProduct();

                      loading.state = !loading.state;
                    },
                  ),
                  SyncButton(
                    text: 'Get Cart',
                    color: Colors.blueAccent,
                    onPress: () {},
                  ),
                  SyncButton(
                    text: 'Get User',
                    color: Colors.amberAccent,
                    onPress: () {},
                  ),
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: Consumer(
                builder: (context, ref, _) {
                  final isLoading = ref.watch(loadingProvider);
                  return isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : const ContentScreen();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
