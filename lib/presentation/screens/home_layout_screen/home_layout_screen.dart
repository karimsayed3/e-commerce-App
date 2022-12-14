import 'package:e_commerce/business/home_layout/home_layout_cubit.dart';
import 'package:e_commerce/data/categories/cateory_model.dart';
import 'package:e_commerce/data/product/product_model.dart';
import 'package:e_commerce/utils/components.dart';
import 'package:e_commerce/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayoutScreen extends StatefulWidget {
  HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  State<HomeLayoutScreen> createState() => _HomeLayoutScreenState();
}

class _HomeLayoutScreenState extends State<HomeLayoutScreen> {


  @override
  Widget build(BuildContext context) {
    var cubit = HomeLayoutCubit.get(context);
    return BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
      builder: (context, state) {
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.access_time_filled_sharp), label: 'Explor'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: 'Explor'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Explor'),
            ],
            onTap: (value) {
              cubit.changePage(value);
            },
            currentIndex: cubit.currentIndex,
          ),
        );
      },
    );
  }

}

