import 'package:martva/src/features/review/dto/review.dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'reviews.repo.g.dart';

abstract class ReviewsRepo {
  Future<List<ReviewDto>> fetchReviews();

  Future<void> setReview(ReviewDto review);
}

class ReviewsRepoImpl implements ReviewsRepo {
  const ReviewsRepoImpl();

  @override
  Future<List<ReviewDto>> fetchReviews() async {
    final request = Supabase.instance.client.rest.from('reviews').select();

    final response = await request;

    final parsed = response.map((json) => ReviewDto.fromJson(json)).toList();

    return parsed;
  }

  @override
  Future<void> setReview(ReviewDto review) async {
    await Supabase.instance.client.from('reviews').upsert(review.toJson());
  }
}

@Riverpod(keepAlive: true)
ReviewsRepo reviewsRepo(ReviewsRepoRef ref) {
  return const ReviewsRepoImpl();
}
