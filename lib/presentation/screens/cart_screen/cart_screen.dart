import 'package:e_commerce/business/home_layout/home_layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<HomeLayoutCubit, HomeLayoutState>(
        listener: (context, state) {
          if (state is AddToCartSuccessStata) {
            Row(
              children: [
                Container(
                  width: 60.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: NetworkImage(
                            (state).productModel.data!.data![0].image!),
                        fit: BoxFit.cover),
                  ),
                ),
              ],
            );
          }
        },
        child: SizedBox.shrink(),
      ),
    );
  }
}
