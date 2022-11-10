import 'package:e_commerce/presentation/screens/product_screen/get_product_by_id_cubit/get_product_by_id_cubit.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/business/home_layout/home_layout_cubit.dart';
import 'package:e_commerce/presentation/screens/home_layout_screen/home_layout_screen.dart';
import 'package:e_commerce/utils/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key, required this.appBarTitle}) : super(key: key);
  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: const TextStyle(
          color: Colors.black,
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          appBarTitle,
          style: const TextStyle(fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<GetProductByIdCubit, GetProductByIdState>(
          builder: (context, state) {
            var cubit = GetProductByIdCubit.get(context);
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
