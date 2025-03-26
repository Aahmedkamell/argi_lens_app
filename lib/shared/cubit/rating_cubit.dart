import 'package:flutter_bloc/flutter_bloc.dart';
import 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit() : super(RatingInitial());

  void setRating(int rating) {
    emit(RatingUpdated(rating));
  }
}
