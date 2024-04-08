// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'issues_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$IssuesState {
  IssuesListModel? get issues => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IssuesStateCopyWith<IssuesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IssuesStateCopyWith<$Res> {
  factory $IssuesStateCopyWith(
          IssuesState value, $Res Function(IssuesState) then) =
      _$IssuesStateCopyWithImpl<$Res, IssuesState>;
  @useResult
  $Res call({IssuesListModel? issues, bool isLoading});

  $IssuesListModelCopyWith<$Res>? get issues;
}

/// @nodoc
class _$IssuesStateCopyWithImpl<$Res, $Val extends IssuesState>
    implements $IssuesStateCopyWith<$Res> {
  _$IssuesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? issues = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      issues: freezed == issues
          ? _value.issues
          : issues // ignore: cast_nullable_to_non_nullable
              as IssuesListModel?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IssuesListModelCopyWith<$Res>? get issues {
    if (_value.issues == null) {
      return null;
    }

    return $IssuesListModelCopyWith<$Res>(_value.issues!, (value) {
      return _then(_value.copyWith(issues: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$IssuesStateImplCopyWith<$Res>
    implements $IssuesStateCopyWith<$Res> {
  factory _$$IssuesStateImplCopyWith(
          _$IssuesStateImpl value, $Res Function(_$IssuesStateImpl) then) =
      __$$IssuesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({IssuesListModel? issues, bool isLoading});

  @override
  $IssuesListModelCopyWith<$Res>? get issues;
}

/// @nodoc
class __$$IssuesStateImplCopyWithImpl<$Res>
    extends _$IssuesStateCopyWithImpl<$Res, _$IssuesStateImpl>
    implements _$$IssuesStateImplCopyWith<$Res> {
  __$$IssuesStateImplCopyWithImpl(
      _$IssuesStateImpl _value, $Res Function(_$IssuesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? issues = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$IssuesStateImpl(
      issues: freezed == issues
          ? _value.issues
          : issues // ignore: cast_nullable_to_non_nullable
              as IssuesListModel?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$IssuesStateImpl implements _IssuesState {
  _$IssuesStateImpl({this.issues, this.isLoading = true});

  @override
  final IssuesListModel? issues;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'IssuesState(issues: $issues, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IssuesStateImpl &&
            (identical(other.issues, issues) || other.issues == issues) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, issues, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IssuesStateImplCopyWith<_$IssuesStateImpl> get copyWith =>
      __$$IssuesStateImplCopyWithImpl<_$IssuesStateImpl>(this, _$identity);
}

abstract class _IssuesState implements IssuesState {
  factory _IssuesState({final IssuesListModel? issues, final bool isLoading}) =
      _$IssuesStateImpl;

  @override
  IssuesListModel? get issues;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$IssuesStateImplCopyWith<_$IssuesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
