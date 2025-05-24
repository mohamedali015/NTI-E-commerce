import 'package:nti_ecommerce/features/home/data/model/slider_model.dart';

abstract class SliderState {}

class SliderInitial extends SliderState {}

class SliderLoading extends SliderState {}

class SliderSuccess extends SliderState {
  final int currentIndex;

  SliderSuccess({required this.currentIndex});
}

class SliderError extends SliderState {
  final String error;

  SliderError({required this.error});
}

class SliderEmpty extends SliderState {}

class SliderChangeIndex extends SliderState {}
