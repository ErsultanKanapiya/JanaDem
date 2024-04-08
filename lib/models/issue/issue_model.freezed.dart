// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'issue_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IssueModel _$IssueModelFromJson(Map<String, dynamic> json) {
  return _IssueModel.fromJson(json);
}

/// @nodoc
mixin _$IssueModel {
  int get id => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get creator => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IssueModelCopyWith<IssueModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IssueModelCopyWith<$Res> {
  factory $IssueModelCopyWith(
          IssueModel value, $Res Function(IssueModel) then) =
      _$IssueModelCopyWithImpl<$Res, IssueModel>;
  @useResult
  $Res call(
      {int id,
      String image,
      String title,
      String description,
      double longitude,
      double latitude,
      String status,
      int creator});
}

/// @nodoc
class _$IssueModelCopyWithImpl<$Res, $Val extends IssueModel>
    implements $IssueModelCopyWith<$Res> {
  _$IssueModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = null,
    Object? title = null,
    Object? description = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? status = null,
    Object? creator = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      creator: null == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IssueModelImplCopyWith<$Res>
    implements $IssueModelCopyWith<$Res> {
  factory _$$IssueModelImplCopyWith(
          _$IssueModelImpl value, $Res Function(_$IssueModelImpl) then) =
      __$$IssueModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String image,
      String title,
      String description,
      double longitude,
      double latitude,
      String status,
      int creator});
}

/// @nodoc
class __$$IssueModelImplCopyWithImpl<$Res>
    extends _$IssueModelCopyWithImpl<$Res, _$IssueModelImpl>
    implements _$$IssueModelImplCopyWith<$Res> {
  __$$IssueModelImplCopyWithImpl(
      _$IssueModelImpl _value, $Res Function(_$IssueModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = null,
    Object? title = null,
    Object? description = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? status = null,
    Object? creator = null,
  }) {
    return _then(_$IssueModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      creator: null == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IssueModelImpl implements _IssueModel {
  const _$IssueModelImpl(
      {required this.id,
      required this.image,
      required this.title,
      required this.description,
      required this.longitude,
      required this.latitude,
      required this.status,
      required this.creator});

  factory _$IssueModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IssueModelImplFromJson(json);

  @override
  final int id;
  @override
  final String image;
  @override
  final String title;
  @override
  final String description;
  @override
  final double longitude;
  @override
  final double latitude;
  @override
  final String status;
  @override
  final int creator;

  @override
  String toString() {
    return 'IssueModel(id: $id, image: $image, title: $title, description: $description, longitude: $longitude, latitude: $latitude, status: $status, creator: $creator)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IssueModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.creator, creator) || other.creator == creator));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, image, title, description,
      longitude, latitude, status, creator);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IssueModelImplCopyWith<_$IssueModelImpl> get copyWith =>
      __$$IssueModelImplCopyWithImpl<_$IssueModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IssueModelImplToJson(
      this,
    );
  }
}

abstract class _IssueModel implements IssueModel {
  const factory _IssueModel(
      {required final int id,
      required final String image,
      required final String title,
      required final String description,
      required final double longitude,
      required final double latitude,
      required final String status,
      required final int creator}) = _$IssueModelImpl;

  factory _IssueModel.fromJson(Map<String, dynamic> json) =
      _$IssueModelImpl.fromJson;

  @override
  int get id;
  @override
  String get image;
  @override
  String get title;
  @override
  String get description;
  @override
  double get longitude;
  @override
  double get latitude;
  @override
  String get status;
  @override
  int get creator;
  @override
  @JsonKey(ignore: true)
  _$$IssueModelImplCopyWith<_$IssueModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
