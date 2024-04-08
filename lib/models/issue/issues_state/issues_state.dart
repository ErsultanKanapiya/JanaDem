import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:janadem/models/issue/issues_list/issues_list_model.dart';

part 'issues_state.freezed.dart';

@freezed
class IssuesState with _$IssuesState {
  factory IssuesState({
    IssuesListModel? issues,
    @Default(true) bool isLoading,
  }) = _IssuesState;
}