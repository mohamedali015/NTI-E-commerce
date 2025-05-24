import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/category_repo.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  static CategoryCubit get(context) => BlocProvider.of(context);

  CategoryRepo categoryRepo = CategoryRepo();

  void getCategories() async {
    emit(CategoryLoading());
    var response = await categoryRepo.getCategories();
    response.fold(
      (error) {
        emit(CategoryError(error: error));
      },
      (categories) {
        if (categories.isEmpty) {
          emit(CategoryEmpty());
        } else {
          emit(CategorySuccess(categories: categories));
        }
      },
    );
  }
}
