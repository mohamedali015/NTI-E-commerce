abstract class BestSellerState {}

class BestSellerInitial extends BestSellerState {}

class BestSellerLoading extends BestSellerState {}

class BestSellerSuccess extends BestSellerState {
  final List<dynamic> bestSellers;

  BestSellerSuccess(this.bestSellers);
}

class BestSellerError extends BestSellerState {
  final String errorMessage;

  BestSellerError(this.errorMessage);
}

class BestSellerEmpty extends BestSellerState {}
