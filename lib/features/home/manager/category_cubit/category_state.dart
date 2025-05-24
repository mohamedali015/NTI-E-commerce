import 'package:nti_ecommerce/features/home/data/model/category_model.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final List<CategoriesModel> categories;

  CategorySuccess({required this.categories});
}

class CategoryError extends CategoryState {
  final String error;

  CategoryError({required this.error});
}

class CategoryEmpty extends CategoryState {}
