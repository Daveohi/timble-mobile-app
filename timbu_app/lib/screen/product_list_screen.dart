import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/provider.dart';
import '../widget/product_item.dart';

// ignore: use_key_in_widget_constructors
class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('TimbuProducts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.black45,
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) {
          if (provider.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (provider.error != null) {
            return Center(child: Text('Error: ${provider.error}'));
          }
          return ListView.builder(
            itemCount: provider.products.length,
            itemBuilder: (context, index) {
              final product = provider.products[index];
              return ProductListItem(
                  product: product); // This should now be recognized
            },
          );
        },
      ),
    );
  }
}
