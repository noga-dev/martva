import 'package:martva/src/features/auth/data/auth_service.dart';
import 'package:martva/src/features/auth/domain/profile.dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user_profile_service.g.dart';

@riverpod
class UserProfileService extends _$UserProfileService {
  @override
  Future<ProfileDto?> build() async {
    final user = ref.watch(authServiceProvider);
    if (user == null) return null;

    final response = await Supabase.instance.client
        .from('profiles')
        .select()
        .eq('id', user.id)
        .single();

    return ProfileDto.fromJson(response);
  }

  Future<void> updateProfile(ProfileDto updatedProfile) async {
    await Supabase.instance.client.from('profiles').upsert({
      'id': updatedProfile.id,
      'name': updatedProfile.name,
      'city': updatedProfile.city,
      'avatar_url': updatedProfile.avatarUrl,
    });

    state = AsyncData(updatedProfile);
  }
}
