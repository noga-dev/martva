// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDto _$ProfileDtoFromJson(Map<String, dynamic> json) => ProfileDto(
      id: json['id'] as String? ?? '',
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
      city: json['city'] as String? ?? '',
      avatarUrl: json['avatarUrl'] as String? ?? '',
    );

Map<String, dynamic> _$ProfileDtoToJson(ProfileDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'city': instance.city,
      'avatarUrl': instance.avatarUrl,
    };

Map<String, dynamic> _$$ProfileDtoImplToJson(_$ProfileDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'city': instance.city,
      'avatarUrl': instance.avatarUrl,
    };
