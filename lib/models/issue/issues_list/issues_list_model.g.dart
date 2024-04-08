// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issues_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IssuesListModelImpl _$$IssuesListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$IssuesListModelImpl(
      issuesList: (json['issuesList'] as List<dynamic>)
          .map((e) => IssueModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$IssuesListModelImplToJson(
        _$IssuesListModelImpl instance) =>
    <String, dynamic>{
      'issuesList': instance.issuesList,
    };
