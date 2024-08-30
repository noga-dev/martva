import 'package:martva/src/features/review/context/review.dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'reviews.service.g.dart';

@riverpod
class ReviewsService extends _$ReviewsService {
  @override
  Future<void> build() async {}

  Future<List<ReviewDto>> getReviews() async {
    final response = await Supabase.instance.client.from('reviews').select();

    final parsed = response.map((json) => ReviewDto.fromJson(json)).toList();

    return parsed;
  }

  Future<void> updateReview(ReviewDto review) async {
    await Supabase.instance.client.from('reviews').insert(review.toJson());
  }
}
