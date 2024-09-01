import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/core/router/router.dart';
import 'package:martva/src/core/utils/extensions/list.dart';
import 'package:martva/src/features/auth/view/user_profile_screen/user_profile_screen.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driving License App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const UserProfileScreen()),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
              onPressed: () => const ReviewsRoute().push(context),
              child: const Text('Reviews'),
            ),
            OutlinedButton(
              onPressed: () => const TicketsRoute().push(context),
              child: const Text('Library'),
            ),
            OutlinedButton(
              onPressed: () => const ExamRoute().push(context),
              child: const Text('Exam'),
            ),
            OutlinedButton(
              onPressed: () => const ChatRoute().push(context),
              child: const Text('Chat'),
            ),
            if (kDebugMode)
              OutlinedButton(
                onPressed: () => const DevDebugTalkerRoute().push(context),
                child: const Text('Talker'),
              ),
          ]
              .intersperse(
                const SizedBox(
                  height: 12,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
