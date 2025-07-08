import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_model.g.dart';
part 'group_model.freezed.dart';

enum Access { SuperModerator, Moderator, Member, Viewer }

@freezed
class Group with _$Group {
  const factory Group(
      {@JsonKey(includeToJson: false, includeFromJson: false) String? uid,
      required String name,
      @JsonKey(defaultValue: "") String? description,
      @JsonKey(name: "meetings", defaultValue: []) List<String>? meetings,
      Map<String, Access>? members,
      @JsonKey(name: "black_list", defaultValue: [])
      List<String>? blackList}) = _Group;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}
