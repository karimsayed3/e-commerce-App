import 'package:bloc/bloc.dart';
import 'package:e_commerce/data/product/product_model.dart';
import 'package:e_commerce/remote/cashe_helper/cashe_helper.dart';
import 'package:e_commerce/remote/dio/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'get_product_by_id_state.dart';

class GetProductByIdCubit extends Cubit<GetProductByIdState> {
  GetProductByIdCubit() : super(GetProductByIdInitial());
  static GetProductByIdCubit get(context) => BlocProvider.of(context);

  ProductModel? productModel;

  void getProductItems({
  int? category_id,
}){
    emit(GetProductItemsLoadingState());
    DioHelper.getdata(url: 'products?category_id=$category_id',token: CacheHelper.getdata(key: 'token')).then((value) {
      productModel = ProductModel.fromJson(value.data);
      debugPrint(productModel!.data!.data![0].name);
      debugPrint("catersdsckjnnnnnnn");
      emit(GetProductItemsSuccessStata(productModel!));
    }).catchError((error){
      debugPrint(error.toString());
      emit(GetProductItemsFailState());
    });
  }
}
