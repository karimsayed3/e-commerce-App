import 'package:bloc/bloc.dart';
import 'package:e_commerce/data/product_details/product_details_model.dart';
import 'package:e_commerce/remote/cashe_helper/cashe_helper.dart';
import 'package:e_commerce/remote/dio/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  static ProductDetailsCubit get(context) => BlocProvider.of(context);

  ProductDetailsModel? productDetailsModel;

  void getProductDetails({
  required int productId
}){
    emit(GetProductItemsDetailsLoadingState());
    DioHelper.getdata(url: 'products/$productId',token: CacheHelper.getdata(key: 'token')).then((productDetails){
      productDetailsModel = ProductDetailsModel.fromJson(productDetails.data);
      emit(GetProductItemsDetailsSuccessStata(productDetailsModel!));
    }).catchError((error){
      debugPrint(error.toString());
      emit(GetProductItemsDetailsFailState());
    });
  }

}
