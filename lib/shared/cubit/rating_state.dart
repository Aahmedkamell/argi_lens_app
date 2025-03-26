abstract class RatingState {}

class RatingInitial extends RatingState {}

class RatingUpdated extends RatingState {
  final int rating;
  RatingUpdated(this.rating);
}
