// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IssueModelImpl _$$IssueModelImplFromJson(Map<String, dynamic> json) =>
    _$IssueModelImpl(
      id: json['id'] as int,
      image: json['image'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      status: json['status'] as String,
      creator: json['creator'] as Map<String, dynamic>,
      next_statuses: (json['next_statuses'] as List<dynamic>)
          .map((e) => StatusModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$IssueModelImplToJson(_$IssueModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'description': instance.description,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'status': instance.status,
      'creator': instance.creator,
      'next_statuses': instance.next_statuses,
    };
