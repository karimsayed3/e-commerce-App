import 'package:bloc/bloc.dart';
import 'package:e_commerce/data/categories/cateory_model.dart';
import 'package:e_commerce/data/product/product_model.dart';
import 'package:e_commerce/presentation/screens/explore_screen/explore_screen.dart';
import 'package:e_commerce/remote/cashe_helper/cashe_helper.dart';
import 'package:e_commerce/remote/dio/dio_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutInitial());
  static HomeLayoutCubit get(context) => BlocProvider.of(context);

  CategoryModel? categoryModel;

  void getCategoryItems(){
    emit(GetCategoryItemsLoadingState());
    DioHelper.getdata(url: 'categories').then((value) {
      categoryModel = CategoryModel.fromJson(value.data);
      debugPrint(categoryModel!.data!.data![0].name);
      debugPrint("catersdsckjnnnnnnn");
      emit(GetCategoryItemsSuccessStata(categoryModel!));
    }).catchError((error){
      debugPrint(error.toString());
      emit(GetCategoryItemsFailState());
    });
  }

   ProductModel? productModel;

  void getProductItems(){
    emit(GetProductItemsLoadingState());
    DioHelper.getdata(url: 'products',token: CacheHelper.getdata(key: 'token')).then((value) {
      productModel = ProductModel.fromJson(value.data);
      debugPrint(productModel!.data!.data![0].name);
      debugPrint("catersdsckjnnnnnnn");
      emit(GetProductItemsSuccessStata(productModel!));
    }).catchError((error){
      debugPrint(error.toString());
      emit(GetProductItemsFailState());
    });
  }

  void getAllData(){
    getCategoryItems();
    getProductItems();
  }

  List<Widget> screens = [
    ExploreScreen(),
    Container(),
    SizedBox(),
  ];

  int currentIndex = 0;

  void changePage(index){
    currentIndex = index;
    emit(ChangeScreenState());
  }

}
