import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/features/auth/repo/auth_service.dart';
import 'package:martva/src/features/auth/repo/user_profile_service.dart';

class UserProfileScreen extends HookConsumerWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfileAsyncValue = ref.watch(userProfileServiceProvider);

    final nameController = useTextEditingController();
    final cityController = useTextEditingController();

    useEffect(() {
      if (userProfileAsyncValue.value != null) {
        nameController.text = userProfileAsyncValue.value!.name;
        cityController.text = userProfileAsyncValue.value!.city;
      }
      return null;
    }, [userProfileAsyncValue]);

    return Scaffold(
      appBar: AppBar(title: const Text('User Profile')),
      body: userProfileAsyncValue.when(
        data: (userProfile) {
          if (userProfile == null) {
            return const Center(child: Text('User not logged in'));
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: userProfile.avatarUrl.isNotEmpty
                        ? NetworkImage(userProfile.avatarUrl)
                        : null,
                    child: userProfile.avatarUrl.isEmpty
                        ? const Icon(Icons.person, size: 50)
                        : null,
                  ),
                ),
                const SizedBox(height: 16),
                Text('Email: ${userProfile.email}'),
                const SizedBox(height: 16),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: cityController,
                  decoration: const InputDecoration(labelText: 'City'),
                ),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      final updatedProfile = userProfile.copyWith(
                        name: nameController.text,
                        city: cityController.text,
                      );
                      await ref
                          .read(userProfileServiceProvider.notifier)
                          .updateProfile(updatedProfile);
                      BotToast.showText(
                        text: 'Profile updated successfully',
                        backgroundColor: Colors.green,
                      );
                    },
                    child: const Text('Update Profile'),
                  ),
                ),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      await ref.read(authServiceProvider.notifier).signOut();
                      // Navigator.of(context).pushReplacementNamed('/login');
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text('Sign Out'),
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
