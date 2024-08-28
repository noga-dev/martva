import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/core/router/router.dart';
import 'package:martva/src/core/utils/extensions/list.dart';
import 'package:martva/src/features/auth/presentation/user_profile_screen/user_profile_screen.dart';

class MainScreen extends HookConsumerWidget {
  const MainScreen({super.key});

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
              onPressed: () => const TicketsRoute().push(context),
              child: const Text('Study session'),
            ),
            OutlinedButton(
              onPressed: () => const TicketsRoute().push(context),
              child: const Text('All Tickets'),
            ),
            OutlinedButton(
              onPressed: () => const ExamRoute().push(context),
              child: const Text('Take Exam'),
            ),
            OutlinedButton(
              onPressed: () => const ChatRoute().push(context),
              child: const Text('Chat Rooms'),
            ),
            if (kDebugMode)
              OutlinedButton(
                onPressed: () => const TalkerRoute().push(context),
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
