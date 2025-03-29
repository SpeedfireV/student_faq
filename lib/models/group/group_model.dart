import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_model.g.dart';
part 'group_model.freezed.dart';

enum Access { SuperModerator, Moderator, Member, Viewer }

@freezed
class Group with _$Group {
  const factory Group(
      {@JsonKey(name: "name") required String name,
      @JsonKey(name: "sessions", defaultValue: []) List<String>? sessions,
      @JsonKey(name: "members") Map<String, Access>? members,
      List<String>? lecturers}) = _Group;

  factory Group.fromJson(Map<String, Object?> json) => _$GroupFromJson(json);
}
