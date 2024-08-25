import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/core/features/chat/presentation/chat_room_screen.dart';
import 'package:martva/src/services/chat_service.dart';
import 'package:martva/src/services/user_profile_service.dart';

class ChatListScreen extends HookConsumerWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfileAsyncValue = ref.watch(userProfileServiceProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Chat Rooms')),
      body: userProfileAsyncValue.when(
        data: (userProfile) {
          if (userProfile == null) {
            return const Center(child: Text('User not logged in'));
          }

          return ListView(
            children: [
              if (userProfile.city != null)
                ListTile(
                  title: Text('${userProfile.city} Chat'),
                  subtitle: const Text('Chat with people in your city'),
                  leading: const Icon(Icons.location_city),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatRoomScreen(
                        type: ChatType.city,
                        id: userProfile.city!,
                        name: '${userProfile.city} Chat',
                      ),
                    ),
                  ),
                ),
              ListTile(
                title: const Text('General Group Chat'),
                subtitle: const Text('Chat with all app users'),
                leading: const Icon(Icons.group),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChatRoomScreen(
                      type: ChatType.group,
                      id: 'general',
                      name: 'General Group Chat',
                    ),
                  ),
                ),
              ),
              ListTile(
                title: const Text('Find Study Partner'),
                subtitle: const Text('Start a direct chat with another user'),
                leading: const Icon(Icons.person_add),
                onTap: () => _showFindPartnerDialog(context, ref),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }

  void _showFindPartnerDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final emailController = TextEditingController();
        return AlertDialog(
          title: const Text('Find Study Partner'),
          content: TextField(
            controller: emailController,
            decoration: const InputDecoration(
              hintText: "Enter partner's email",
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Start Chat'),
              onPressed: () async {
                // Here you would typically check if the user exists and get their ID
                // For simplicity, we'll just use the email as the ID
                final partnerId = emailController.text;
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatRoomScreen(
                      type: ChatType.direct,
                      id: partnerId,
                      name: partnerId,
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
