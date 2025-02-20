import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'programme_model.g.dart';
part 'programme_model.freezed.dart';

@freezed
class Programme with _$Programme {
  const factory Programme({
    @JsonKey(name: "name") required Map<String, String> name,
    @JsonKey(name: "classtype_name") required Map<String, String> groupType,
    @JsonKey(name: "start_time") required DateTime startDate,
    @JsonKey(name: "end_time") required DateTime endDate,
    List<String>? lecturers,
  }) = _Programme;

  factory Programme.fromJson(Map<String, Object?> json) =>
      _$ProgrammeFromJson(json);
}