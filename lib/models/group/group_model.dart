import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_model.g.dart';
part 'group_model.freezed.dart';

enum Access { SuperModerator, Moderator, Member, Viewer }

@freezed
class Group with _$Group {
  const factory Group(
      {
        required String name,
        @JsonKey(defaultValue: "") String? description,
        @JsonKey(name: "sessions", defaultValue: []) List<String>? sessions,
        Map<String, Access>? members,
        @JsonKey(name: "black_list", defaultValue: []) List<String>? blackList}) = _Group;

  factory Group.fromJson(Map<String, Object?> json) => _$GroupFromJson(json);
}
