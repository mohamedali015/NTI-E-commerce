import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nti_ecommerce/features/home/data/model/product_model.dart';

import '../../../../core/network/api_helper.dart';
import '../../../../core/network/end_points.dart';

class BestSellerRepo {
  // singleton pattern
  BestSellerRepo._();

  static final BestSellerRepo _instance = BestSellerRepo._();

  factory BestSellerRepo() => _instance;

  Future<Either<String, List<BestSellerProducts>>> getBestSellers() async {
    try {
      var response = await ApiHelper().getRequest(
        endPoint: EndPoints.bestSellerProducts,
        isProtected: true,
      );

      ProductsResponse bestSeller = ProductsResponse.fromJson(response.data);

      if (response.status == true) {
        if (bestSeller.bestSellerProducts != null) {
          return Right(bestSeller.bestSellerProducts!);
        } else {
          throw Exception('Error fetching Best Seller Products');
        }
      } else {
        throw Exception('Error fetching Best Seller Products');
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
