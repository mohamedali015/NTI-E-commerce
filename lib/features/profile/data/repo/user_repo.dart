import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nti_ecommerce/core/network/api_helper.dart';
import 'package:nti_ecommerce/core/network/api_response.dart';
import 'package:nti_ecommerce/core/network/end_points.dart';
import 'package:nti_ecommerce/features/profile/data/model/user_model.dart';

class UserRepo {
  UserRepo._();

  static final UserRepo _instance = UserRepo._();

  factory UserRepo() => _instance;

  ApiHelper apiHelper = ApiHelper();

  UserModel userModel = UserModel();

  // get user data
  Future<Either<String, UserModel>> getUserData() async {
    try {
      var response = await apiHelper.getRequest(
        endPoint: EndPoints.getUserData,
        isProtected: true,
      );

      if (response.status) {
        userModel = UserModel.fromJson(response.data['user']);
        return Right(userModel);
      } else {
        throw Exception(response.message);
      }
    } catch (e) {
      ApiResponse apiResponse = ApiResponse.fromError(e);
      return Left(apiResponse.message);
    }
  }

  // update user data
  Future<Either<String, String>> updateUserData({
    required String name,
    required String phone,
    required XFile? imageFile,
  }) async {
    try {
      ApiResponse apiResponse = await apiHelper.putRequest(
        endPoint: EndPoints.updateProfile,
        isProtected: true,
        data: {
          'name': name,
          'phone': phone,
          'image': imageFile != null
              ? await MultipartFile.fromFile(imageFile.path,
                  filename: imageFile.name)
              : null,
        },
      );

      if (apiResponse.status) {
        return right(apiResponse.message);
      } else {
        throw Exception(apiResponse.message);
      }
    } catch (e) {
      ApiResponse apiResponse = ApiResponse.fromError(e);
      return Left(apiResponse.message);
    }
  }

  Future<Either<String, String>> deleteUserData() async {
    try {
      ApiResponse apiResponse = await apiHelper.deleteRequest(
        endPoint: EndPoints.deleteUser,
        isProtected: true,
      );

      if (apiResponse.status) {
        return right(apiResponse.message);
      } else {
        throw Exception(apiResponse.message);
      }
    } catch (e) {
      ApiResponse apiResponse = ApiResponse.fromError(e);
      return Left(apiResponse.message);
    }
  }
}
