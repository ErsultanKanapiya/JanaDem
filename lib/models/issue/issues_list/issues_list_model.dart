import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:janadem/models/issue/issue_model.dart';


part 'issues_list_model.freezed.dart';
part 'issues_list_model.g.dart';

@freezed
class IssuesListModel with _$IssuesListModel {
  const factory IssuesListModel({
    required List<IssueModel> issuesList,
  }) = _IssuesListModel;

  factory IssuesListModel.fromJson(Map<String, dynamic> json) =>
      _$IssuesListModelFromJson(json);
}
