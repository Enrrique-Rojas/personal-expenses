import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.entity.freezed.dart';
part 'auth.entity.g.dart';

@freezed
class AuthEntity with _$AuthEntity {
  const factory AuthEntity({
    required String email,
    required String password
  }) = _AuthEntity;

  factory AuthEntity.fromJson(Map<String, dynamic> json) =>
      _$AuthEntityFromJson(json);
}
