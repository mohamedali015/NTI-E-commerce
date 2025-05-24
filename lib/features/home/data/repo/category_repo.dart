import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/api_helper.dart';
import '../../../../core/network/end_points.dart';
import '../model/category_model.dart';

class CategoryRepo {
  // singleton
  static final CategoryRepo _instance = CategoryRepo._();

  CategoryRepo._();

  factory CategoryRepo() => _instance;

  List<CategoriesModel> categories = [];

  // get categories
  Future<Either<String, List<CategoriesModel>>> getCategories() async {
    try {
      var response = await ApiHelper().getRequest(
        endPoint: EndPoints.categories,
        isProtected: true,
      );

      CategoriesResponse categoryResponseModel =
          CategoriesResponse.fromJson(response.data);

      if (response.status != null && response.status == true) {
        if (categoryResponseModel.categories != null) {
          return Right(categoryResponseModel.categories!);
        } else {
          throw Exception('Error fetching categories');
        }
      } else {
        throw Exception('Error fetching categories');
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response?.data['message'] != null) {
          return Left(e.response?.data['message']);
        }
      }
      return Left(e.toString());
    }
  }
}
