part of 'review_cubit.dart';
@immutable
abstract class ReviewState {}
final class ReviewInitial extends ReviewState {}
class ReviewErrorState extends ReviewState{
  final FailureReview failureReview;
  ReviewErrorState(this.failureReview);
}
class ReviewSuccessState extends ReviewState{}
class ReviewLoadingState extends ReviewState{}
class ReviewFailureState extends ReviewState{
  final String failure;
  ReviewFailureState(this.failure);
}
