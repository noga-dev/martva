// lib/presentation/screens/ticket_screen.dart
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/features/review/service/reviews_service.dart';

class ReviewsScreen extends ConsumerWidget {
  const ReviewsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewsAsyncValue = ref.watch(reviewsServiceProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Review Ticket')),
      body: reviewsAsyncValue.when(
        data: (reviews) {
          return PageView.builder(
            itemCount: reviews.length,
            itemBuilder: (context, index) {
              return Text(reviews[index].ticketId);
            },
          );
        },
        loading: () => const CircularProgressIndicator(),
        error: (error, stack) => Text('Error: $error'),
      ),
    );
  }
}
