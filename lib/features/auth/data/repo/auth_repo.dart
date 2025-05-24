import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nti_ecommerce/core/cache/cache_data.dart';
import 'package:nti_ecommerce/features/home/data/model/user_model.dart';

import '../../../../core/cache/cache_helper.dart';
import '../../../../core/cache/cache_key.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/end_points.dart';

class AuthRepo {
  // singleton
  AuthRepo._internal();

  static final AuthRepo _repo = AuthRepo._internal();

  factory AuthRepo() => _repo;

  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, void>> register({
    required String email,
    required String password,
    required XFile? image,
    required String name,
    required String phone,
  }) async {
    try {
      await apiHelper.postRequest(endPoint: EndPoints.register, data: {
        'name': name,
        'password': password,
        'email': email,
        'phone': phone,
        // 'image': image == null
        //     ? null
        //     : await MultipartFile.fromFile(image.path, filename: image.name),
      });
      return Right(null);
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response?.data['message'] != null) {
          return Left(e.response?.data['message']);
        }
      }

      print("Error ${e.toString()}");
      return Left(e.toString());
    }
  }

  Future<Either<String, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      ApiResponse response = await apiHelper.postRequest(
          endPoint: EndPoints.login,
          data: {'email': email, 'password': password});

      LoginResponseModel loginResponseModel =
          LoginResponseModel.fromJson(response.data);
      if (loginResponseModel.status != null &&
          loginResponseModel.status == true) {
        // store tokens
        await CacheHelper.saveData(
            key: CacheKeys.accessToken, value: loginResponseModel.accessToken);
        await CacheHelper.saveData(
            key: CacheKeys.refreshToken,
            value: loginResponseModel.refreshToken);
        CacheData.accessToken = loginResponseModel.accessToken;
        CacheData.refreshToken = loginResponseModel.refreshToken;
        // return user model
        if (loginResponseModel.user != null) {
          return Right(loginResponseModel.user!);
        } else {
          throw Exception("Login Failed\nTry Again later");
        }
      } else {
        throw Exception("Login Failed\nTry Again later");
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response?.data['message'] != null) {
          return Left(e.response?.data['message']);
        }
      }

      print("Error ${e.toString()}");
      return Left(e.toString());
    }
  }
}
