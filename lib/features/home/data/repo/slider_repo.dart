import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nti_ecommerce/features/home/data/model/slider_model.dart';

import '../../../../core/network/api_helper.dart';
import '../../../../core/network/end_points.dart';

class SliderRepo {
  // singleton
  static final SliderRepo _instance = SliderRepo._();

  SliderRepo._();

  factory SliderRepo() => _instance;

  List<SliderRepo> categories = [];

  // get categories
  Future<Either<String, List<SliderModel>>> getSliders() async {
    try {
      var response = await ApiHelper().getRequest(
        endPoint: EndPoints.sliders,
        isProtected: true,
      );

      SliderResponse sliderResponseModel =
          SliderResponse.fromJson(response.data);

      if (response.status != null && response.status == true) {
        if (sliderResponseModel.sliders != null) {
          return Right(sliderResponseModel.sliders!);
        } else {
          throw Exception('Error fetching Sliders');
        }
      } else {
        throw Exception('Error fetching Sliders');
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
