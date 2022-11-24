part of 'home_layout_cubit.dart';

@immutable
abstract class HomeLayoutState {}

class HomeLayoutInitial extends HomeLayoutState {}

//Category
class GetCategoryItemsLoadingState extends HomeLayoutState {}
class GetCategoryItemsSuccessStata extends HomeLayoutState {
  CategoryModel categoryModel;
  GetCategoryItemsSuccessStata(this.categoryModel);
}
class GetCategoryItemsFailState extends HomeLayoutState {}

// Product
class GetProductItemsLoadingState extends HomeLayoutState {}
class GetProductItemsSuccessStata extends HomeLayoutState {
  ProductModel productModel;
  GetProductItemsSuccessStata(this.productModel);
}
class GetProductItemsFailState extends HomeLayoutState {}

// AddToCart
class AddToCartLoadingState extends HomeLayoutState {}
class AddToCartSuccessStata extends HomeLayoutState {
  AddToCartProductData productModel;
  AddToCartSuccessStata(this.productModel);
}
class AddToCartFailState extends HomeLayoutState {}

// RemoveFromCart
class RemoveFromCartLoadingState extends HomeLayoutState {}
class RemoveFromCartSuccessStata extends HomeLayoutState {
  ProductModel productModel;
  RemoveFromCartSuccessStata(this.productModel);
}
class RemoveFromCartFailState extends HomeLayoutState {}


class ChangeScreenState extends HomeLayoutState{}



