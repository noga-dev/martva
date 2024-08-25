import 'package:martva/src/core/features/auth/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user_profile_service.g.dart';

class UserProfile {
  final String id;
  final String email;
  final String? name;
  final String? city;
  final String? avatarUrl;

  UserProfile({
    required this.id,
    required this.email,
    this.name,
    this.city,
    this.avatarUrl,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      city: json['city'],
      avatarUrl: json['avatar_url'],
    );
  }

  UserProfile copyWith({
    String? name,
    String? city,
    String? avatarUrl,
  }) {
    return UserProfile(
      id: id,
      email: email,
      name: name ?? this.name,
      city: city ?? this.city,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }
}

@riverpod
class UserProfileService extends _$UserProfileService {
  @override
  Future<UserProfile?> build() async {
    final user = ref.watch(authServiceProvider);
    if (user == null) return null;

    final response = await Supabase.instance.client
        .from('profiles')
        .select()
        .eq('id', user.id)
        .single();

    return UserProfile.fromJson(response);
  }

  Future<void> updateProfile(UserProfile updatedProfile) async {
    await Supabase.instance.client.from('profiles').upsert({
      'id': updatedProfile.id,
      'name': updatedProfile.name,
      'city': updatedProfile.city,
      'avatar_url': updatedProfile.avatarUrl,
    });

    state = AsyncData(updatedProfile);
  }
}
