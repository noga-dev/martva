import 'package:martva/src/core/utils/messaging/talker.dart';
import 'package:martva/src/features/review/dto/review.dto.dart';
import 'package:martva/src/features/review/repo/reviews.repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reviews_service.g.dart';

@riverpod
class ReviewsService extends _$ReviewsService {
  @override
  Future<List<ReviewDto>> build() async {
    final reviews = await getReviews();

    talker.info('ReviewsService build');

    return reviews;
  }

  Future<List<ReviewDto>> getReviews() async {
    final repo = ref.read(reviewsRepoProvider);

    final results = repo.fetchReviews();

    return results;
  }

  Future<void> updateReview(ReviewDto review, bool correct) async {
    final updatedReview = calculateNextReview(review, correct);
    final repo = ref.read(reviewsRepoProvider);
    await repo.setReview(review);

    state = AsyncData([
      ...state.requireValue.where((r) => r.ticketId != review.ticketId),
      updatedReview,
    ]);
  }

  ReviewDto calculateNextReview(ReviewDto review, bool correct) {
    final now = DateTime.now();
    double easeFactor = review.easeFactor;
    int interval = review.interval;
    int repetitions = review.repetitions;

    if (correct) {
      repetitions += 1;
      easeFactor = easeFactor + 0.1;
      if (repetitions == 1) {
        interval = 1;
      } else if (repetitions == 2) {
        interval = 6;
      } else {
        interval = (interval * easeFactor).round();
      }
    } else {
      repetitions = 0;
      interval = 1;
      easeFactor = easeFactor - 0.2;
      if (easeFactor < 1.3) {
        easeFactor = 1.3;
      }
    }

    final nextReviewDate = now.add(Duration(days: interval));

    return review.copyWith(
      nextReviewAt: nextReviewDate.toIso8601String(),
      interval: interval,
      repetitions: repetitions,
      easeFactor: easeFactor,
    );
  }
}
