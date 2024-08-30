import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.dto.freezed.dart';
part 'profile.dto.g.dart';

@JsonSerializable()
@Freezed(fromJson: false)
class ProfileDto with _$ProfileDto {
  const factory ProfileDto({
    @Default('') @JsonKey(defaultValue: '') String id,
    @Default('') @JsonKey(defaultValue: '') String email,
    @Default('') @JsonKey(defaultValue: '') String name,
    @Default('') @JsonKey(defaultValue: '') String city,
    @Default('') @JsonKey(defaultValue: '') String avatarUrl,
  }) = _ProfileDto;

  factory ProfileDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileDtoFromJson(json);
}
