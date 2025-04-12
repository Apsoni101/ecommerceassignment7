import 'package:assignment7/core/constants/app_colors.dart';
import 'package:assignment7/feature/cart/presentation/bloc/product_cart_bloc.dart';
import 'package:assignment7/feature/products_list/presentation/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/setup_locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductCartBloc>(
      create: (context) => sl<ProductCartBloc>()..add(LoadCartItemsEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: AppColors.white,
            appBarTheme: AppBarTheme(backgroundColor: AppColors.white)),
        home: const ProductListScreen(),
      ),
    );
  }
}
