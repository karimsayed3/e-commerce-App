import 'package:e_commerce/business/home_layout/home_layout_cubit.dart';
import 'package:e_commerce/presentation/screens/home_layout_screen/home_layout_screen.dart';
import 'package:e_commerce/utils/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeAllProducts extends StatelessWidget {
  const SeeAllProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title:const Text(
          'All Products',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        titleTextStyle:const TextStyle(
          color: Colors.black,
        ),
        iconTheme:const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
          builder: (context, state) {
            var cubit = HomeLayoutCubit.get(context);
            if (cubit.productModel != null) {
              return productItem(context, cubit.productModel!.data!.data!,
                  cubit.productModel!.data!.total);
            } else {
              return SizedBox(
                height: height,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
