import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_ecommerce/features/home/manager/best_seller_cubit/best_seller_state.dart';

import '../../data/repo/best_seller_repo.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit() : super(BestSellerInitial());

  static BestSellerCubit get(context) => BlocProvider.of(context);

  void getBestSeller() async {
    BestSellerRepo bestSellerRepo = BestSellerRepo();

    emit(BestSellerLoading());
    var response = await bestSellerRepo.getBestSellers();
    response.fold(
      (error) {
        emit(BestSellerError(error));
      },
      (sliders) {
        if (sliders.isEmpty) {
          emit(BestSellerEmpty());
        } else {
          emit(BestSellerSuccess(sliders));
        }
      },
    );
  }
}
