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


class ChangeScreenState extends HomeLayoutState{}
