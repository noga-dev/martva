import 'package:martva/src/features/review/context/review.dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'reviews.repo.g.dart';

abstract class ReviewsRepo {
  Future<List<ReviewDto>> fetchReviews();

  Stream<List<ReviewDto>> watchReviews();

  Future<void> setReview(ReviewDto review);
}

class ReviewsRepoImpl implements ReviewsRepo {
  const ReviewsRepoImpl();

  @override
  Future<List<ReviewDto>> fetchReviews() async {
    final request = Supabase.instance.client.rest.from('reviews').select();
    final response = await request;
    final reviews = response.map((json) => ReviewDto.fromJson(json)).toList();
    return reviews;
  }

  @override
  Future<void> setReview(ReviewDto review) {
    throw UnimplementedError();
  }

  @override
  Stream<List<ReviewDto>> watchReviews() {
    throw UnimplementedError();
  }
}

@Riverpod(keepAlive: true)
ReviewsRepo reviewsRepo(ReviewsRepoRef ref) {
  return const ReviewsRepoImpl();
}
