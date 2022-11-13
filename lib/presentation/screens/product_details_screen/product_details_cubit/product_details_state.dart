part of 'product_details_cubit.dart';

@immutable
abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class GetProductItemsDetailsLoadingState extends ProductDetailsState {}
class GetProductItemsDetailsSuccessStata extends ProductDetailsState {
  ProductDetailsModel productDetailsModel;
  GetProductItemsDetailsSuccessStata(this.productDetailsModel);
}
class GetProductItemsDetailsFailState extends ProductDetailsState {}
