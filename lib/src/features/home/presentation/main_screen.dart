import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/core/router/router.dart';
import 'package:martva/src/core/utils/extensions/list.dart';
import 'package:martva/src/features/auth/presentation/user_profile_screen/user_profile_screen.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class MainScreen extends HookConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // showLoadingSparks: true,
      // loadingProgress: 0.5,
      // loadingProgressIndeterminate: true,
      headers: [
        AppBar(
          title: const Text('Driving License App'),
          trailing: [
            Button.ghost(
              child: const Icon(Icons.person),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UserProfileScreen()),
              ),
            ),
          ],
        )
      ],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlineButton(
              onPressed: () => const TicketsRoute().push(context),
              child: const Text('Study session'),
            ),
            OutlineButton(
              onPressed: () => const TicketsRoute().push(context),
              child: const Text('All Tickets'),
            ),
            OutlineButton(
              onPressed: () => const ExamRoute().push(context),
              child: const Text('Take Exam'),
            ),
            OutlineButton(
              onPressed: () => const ChatRoute().push(context),
              child: const Text('Chat Rooms'),
            ),
            if (kDebugMode)
              OutlineButton(
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
