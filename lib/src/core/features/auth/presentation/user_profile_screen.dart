import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/core/features/auth/auth_service.dart';
import 'package:martva/src/services/user_profile_service.dart';

class UserProfileScreen extends HookConsumerWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfileAsyncValue = ref.watch(userProfileServiceProvider);
    final nameController = TextEditingController();
    final cityController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('User Profile')),
      body: userProfileAsyncValue.when(
        data: (userProfile) {
          if (userProfile == null) {
            return const Center(child: Text('User not logged in'));
          }

          nameController.text = userProfile.name ?? '';
          cityController.text = userProfile.city ?? '';

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: userProfile.avatarUrl != null
                        ? NetworkImage(userProfile.avatarUrl!)
                        : null,
                    child: userProfile.avatarUrl == null
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Profile updated successfully')),
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
                      Navigator.of(context).pushReplacementNamed('/login');
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
