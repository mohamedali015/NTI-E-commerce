import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/api_helper.dart';
import '../../../../core/network/end_points.dart';
import '../model/user_model.dart';

class HomeRepo {
  // singleton
  static final HomeRepo _instance = HomeRepo._();

  factory HomeRepo() => _instance;

  HomeRepo._();

  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, UserModel>> getUserData() async {
    try {
      var response = await apiHelper.getRequest(
          endPoint: EndPoints.getUserData, isProtected: true);
      LoginResponseModel loginResponseModel =
          LoginResponseModel.fromJson(response.data);
      if (loginResponseModel.status != null &&
          loginResponseModel.status == true) {
        if (loginResponseModel.user != null) {
          return Right(loginResponseModel.user!);
        } else {
          throw Exception("Login Failed \n try again later");
        }
      } else {
        throw Exception("Login Failed \n try again later");
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
