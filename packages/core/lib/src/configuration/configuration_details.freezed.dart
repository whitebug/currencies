// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'configuration_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConfigurationDetails {
  String get serverUrl => throw _privateConstructorUsedError;
  bool get enableLog => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConfigurationDetailsCopyWith<ConfigurationDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigurationDetailsCopyWith<$Res> {
  factory $ConfigurationDetailsCopyWith(ConfigurationDetails value,
          $Res Function(ConfigurationDetails) then) =
      _$ConfigurationDetailsCopyWithImpl<$Res, ConfigurationDetails>;
  @useResult
  $Res call({String serverUrl, bool enableLog});
}

/// @nodoc
class _$ConfigurationDetailsCopyWithImpl<$Res,
        $Val extends ConfigurationDetails>
    implements $ConfigurationDetailsCopyWith<$Res> {
  _$ConfigurationDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverUrl = null,
    Object? enableLog = null,
  }) {
    return _then(_value.copyWith(
      serverUrl: null == serverUrl
          ? _value.serverUrl
          : serverUrl // ignore: cast_nullable_to_non_nullable
              as String,
      enableLog: null == enableLog
          ? _value.enableLog
          : enableLog // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConfigurationDetailsImplCopyWith<$Res>
    implements $ConfigurationDetailsCopyWith<$Res> {
  factory _$$ConfigurationDetailsImplCopyWith(_$ConfigurationDetailsImpl value,
          $Res Function(_$ConfigurationDetailsImpl) then) =
      __$$ConfigurationDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String serverUrl, bool enableLog});
}

/// @nodoc
class __$$ConfigurationDetailsImplCopyWithImpl<$Res>
    extends _$ConfigurationDetailsCopyWithImpl<$Res, _$ConfigurationDetailsImpl>
    implements _$$ConfigurationDetailsImplCopyWith<$Res> {
  __$$ConfigurationDetailsImplCopyWithImpl(_$ConfigurationDetailsImpl _value,
      $Res Function(_$ConfigurationDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverUrl = null,
    Object? enableLog = null,
  }) {
    return _then(_$ConfigurationDetailsImpl(
      serverUrl: null == serverUrl
          ? _value.serverUrl
          : serverUrl // ignore: cast_nullable_to_non_nullable
              as String,
      enableLog: null == enableLog
          ? _value.enableLog
          : enableLog // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ConfigurationDetailsImpl implements _ConfigurationDetails {
  const _$ConfigurationDetailsImpl(
      {required this.serverUrl, required this.enableLog});

  @override
  final String serverUrl;
  @override
  final bool enableLog;

  @override
  String toString() {
    return 'ConfigurationDetails(serverUrl: $serverUrl, enableLog: $enableLog)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigurationDetailsImpl &&
            (identical(other.serverUrl, serverUrl) ||
                other.serverUrl == serverUrl) &&
            (identical(other.enableLog, enableLog) ||
                other.enableLog == enableLog));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serverUrl, enableLog);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfigurationDetailsImplCopyWith<_$ConfigurationDetailsImpl>
      get copyWith =>
          __$$ConfigurationDetailsImplCopyWithImpl<_$ConfigurationDetailsImpl>(
              this, _$identity);
}

abstract class _ConfigurationDetails implements ConfigurationDetails {
  const factory _ConfigurationDetails(
      {required final String serverUrl,
      required final bool enableLog}) = _$ConfigurationDetailsImpl;

  @override
  String get serverUrl;
  @override
  bool get enableLog;
  @override
  @JsonKey(ignore: true)
  _$$ConfigurationDetailsImplCopyWith<_$ConfigurationDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
