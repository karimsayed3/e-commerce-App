part of 'get_product_by_id_cubit.dart';

@immutable
abstract class GetProductByIdState {}

class GetProductByIdInitial extends GetProductByIdState {}


class GetProductItemsLoadingState extends GetProductByIdState {}
class GetProductItemsSuccessStata extends GetProductByIdState {
  ProductModel productModel;
  GetProductItemsSuccessStata(this.productModel);
}
class GetProductItemsFailState extends GetProductByIdState {}
