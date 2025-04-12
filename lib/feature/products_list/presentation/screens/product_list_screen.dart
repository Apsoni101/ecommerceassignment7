import 'package:assignment7/core/di/setup_locator.dart';
import 'package:assignment7/feature/products_list/presentation/bloc/product_list_bloc.dart';
import 'package:assignment7/feature/products_list/presentation/widgets/product_list_grid.dart';
import 'package:assignment7/feature/products_list/presentation/widgets/product_list_screen_app_bar.dart';
import 'package:assignment7/feature/products_list/presentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductListBloc>()..add(FetchProductsListEvent()),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ProductListScreenAppBar(),
                ProductListSearchRow(),
                ProductListGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
