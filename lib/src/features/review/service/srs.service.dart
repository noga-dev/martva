import 'package:martva/src/core/utils/extensions/string.dart';
import 'package:martva/src/features/review/context/review.dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'srs.service.g.dart';

class SRSService {
  final List<int> intervals = [1, 3, 7, 14, 30, 60, 120, 240];

  ReviewDto processReview(ReviewDto review, bool correct) {
    int newStage = correct ? review.stage + 1 : 0;
    int newInterval = intervals[newStage.clamp(0, intervals.length - 1)];

    return review.copyWith(
      stage: newStage,
      interval: newInterval,
      nextReviewAt:
          DateTime.now().add(Duration(days: newInterval)).toIso8601String(),
    );
  }

  List<ReviewDto> getDueReviews(List<ReviewDto> reviews) {
    final now = DateTime.now();
    return reviews
        .where(
            (review) => review.nextReviewAt.toISO8601DateTime().isBefore(now))
        .toList();
  }
}

@riverpod
SRSService sRSServiceProvider(SRSServiceProviderRef ref) => SRSService();
