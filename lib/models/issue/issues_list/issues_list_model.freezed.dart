// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'issues_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IssuesListModel _$IssuesListModelFromJson(Map<String, dynamic> json) {
  return _IssuesListModel.fromJson(json);
}

/// @nodoc
mixin _$IssuesListModel {
  List<IssueModel> get issuesList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IssuesListModelCopyWith<IssuesListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IssuesListModelCopyWith<$Res> {
  factory $IssuesListModelCopyWith(
          IssuesListModel value, $Res Function(IssuesListModel) then) =
      _$IssuesListModelCopyWithImpl<$Res, IssuesListModel>;
  @useResult
  $Res call({List<IssueModel> issuesList});
}

/// @nodoc
class _$IssuesListModelCopyWithImpl<$Res, $Val extends IssuesListModel>
    implements $IssuesListModelCopyWith<$Res> {
  _$IssuesListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? issuesList = null,
  }) {
    return _then(_value.copyWith(
      issuesList: null == issuesList
          ? _value.issuesList
          : issuesList // ignore: cast_nullable_to_non_nullable
              as List<IssueModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IssuesListModelImplCopyWith<$Res>
    implements $IssuesListModelCopyWith<$Res> {
  factory _$$IssuesListModelImplCopyWith(_$IssuesListModelImpl value,
          $Res Function(_$IssuesListModelImpl) then) =
      __$$IssuesListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<IssueModel> issuesList});
}

/// @nodoc
class __$$IssuesListModelImplCopyWithImpl<$Res>
    extends _$IssuesListModelCopyWithImpl<$Res, _$IssuesListModelImpl>
    implements _$$IssuesListModelImplCopyWith<$Res> {
  __$$IssuesListModelImplCopyWithImpl(
      _$IssuesListModelImpl _value, $Res Function(_$IssuesListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? issuesList = null,
  }) {
    return _then(_$IssuesListModelImpl(
      issuesList: null == issuesList
          ? _value._issuesList
          : issuesList // ignore: cast_nullable_to_non_nullable
              as List<IssueModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IssuesListModelImpl implements _IssuesListModel {
  const _$IssuesListModelImpl({required final List<IssueModel> issuesList})
      : _issuesList = issuesList;

  factory _$IssuesListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IssuesListModelImplFromJson(json);

  final List<IssueModel> _issuesList;
  @override
  List<IssueModel> get issuesList {
    if (_issuesList is EqualUnmodifiableListView) return _issuesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_issuesList);
  }

  @override
  String toString() {
    return 'IssuesListModel(issuesList: $issuesList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IssuesListModelImpl &&
            const DeepCollectionEquality()
                .equals(other._issuesList, _issuesList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_issuesList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IssuesListModelImplCopyWith<_$IssuesListModelImpl> get copyWith =>
      __$$IssuesListModelImplCopyWithImpl<_$IssuesListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IssuesListModelImplToJson(
      this,
    );
  }
}

abstract class _IssuesListModel implements IssuesListModel {
  const factory _IssuesListModel({required final List<IssueModel> issuesList}) =
      _$IssuesListModelImpl;

  factory _IssuesListModel.fromJson(Map<String, dynamic> json) =
      _$IssuesListModelImpl.fromJson;

  @override
  List<IssueModel> get issuesList;
  @override
  @JsonKey(ignore: true)
  _$$IssuesListModelImplCopyWith<_$IssuesListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
