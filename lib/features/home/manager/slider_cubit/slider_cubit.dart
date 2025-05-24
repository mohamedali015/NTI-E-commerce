import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/slider_model.dart';
import '../../data/repo/slider_repo.dart';
import 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit() : super(SliderInitial());

  static SliderCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  SliderRepo sliderRepo = SliderRepo();

  List<SliderModel> slidersList = [];

  void getSliders() async {
    emit(SliderLoading());
    var response = await sliderRepo.getSliders();
    response.fold(
      (error) {
        emit(SliderError(error: error));
      },
      (sliders) {
        if (sliders.isEmpty) {
          emit(SliderEmpty());
        } else {
          slidersList = sliders;
          emit(SliderSuccess(currentIndex: currentIndex));
        }
      },
    );
  }

  void changeIndex(int index) {
    currentIndex = index;
    emit(SliderSuccess(currentIndex: currentIndex));
    // emit(SliderChangeIndex());
  }
}
