import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_ecommerce/features/home/manager/user_cubit/user_state.dart';

import '../../data/model/user_model.dart';
import '../../data/repo/home_repo.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  HomeRepo homeRepo = HomeRepo();

  static UserCubit get(context) => BlocProvider.of(context);

  void getUserData({required UserModel user}) {
    emit(UserGetSuccess(userModel: user));
  }

  Future<bool> getUserDataFromApi() async {
    emit(UserLoading());
    var response = await homeRepo.getUserData();
    return response.fold(
      (error) {
        emit(UserGetError(error: error));
        return false;
      },
      (user) {
        emit(UserGetSuccess(userModel: user));
        return true;
      },
    );
  }
}
