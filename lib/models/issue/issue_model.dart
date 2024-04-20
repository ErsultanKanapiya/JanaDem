import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:janadem/models/status/status_model.dart';

part 'issue_model.freezed.dart';
part 'issue_model.g.dart';

// IssueModel

@freezed
class IssueModel with _$IssueModel {
  const factory IssueModel({
    required int id,
    required String image,
    required String title,
    required String description,
    required double longitude,
    required double latitude,
    required String status,
    required Map creator,
    required List<StatusModel> next_statuses
  }) = _IssueModel;

  factory IssueModel.fromJson(Map<String, dynamic> json) =>
      _$IssueModelFromJson(json);

}
