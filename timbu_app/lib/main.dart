import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/provider.dart';
import 'screen/product_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider()..fetchProducts(),
      child: MaterialApp(
        home: ProductListScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
