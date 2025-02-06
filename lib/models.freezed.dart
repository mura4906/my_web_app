// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Resident {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Location get location => throw _privateConstructorUsedError;
  bool get canPingPong => throw _privateConstructorUsedError;
  Memo get memo => throw _privateConstructorUsedError;

  /// Create a copy of Resident
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResidentCopyWith<Resident> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResidentCopyWith<$Res> {
  factory $ResidentCopyWith(Resident value, $Res Function(Resident) then) =
      _$ResidentCopyWithImpl<$Res, Resident>;
  @useResult
  $Res call(
      {String id, String name, Location location, bool canPingPong, Memo memo});

  $MemoCopyWith<$Res> get memo;
}

/// @nodoc
class _$ResidentCopyWithImpl<$Res, $Val extends Resident>
    implements $ResidentCopyWith<$Res> {
  _$ResidentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Resident
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? location = null,
    Object? canPingPong = null,
    Object? memo = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      canPingPong: null == canPingPong
          ? _value.canPingPong
          : canPingPong // ignore: cast_nullable_to_non_nullable
              as bool,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as Memo,
    ) as $Val);
  }

  /// Create a copy of Resident
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MemoCopyWith<$Res> get memo {
    return $MemoCopyWith<$Res>(_value.memo, (value) {
      return _then(_value.copyWith(memo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResidentImplCopyWith<$Res>
    implements $ResidentCopyWith<$Res> {
  factory _$$ResidentImplCopyWith(
          _$ResidentImpl value, $Res Function(_$ResidentImpl) then) =
      __$$ResidentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String name, Location location, bool canPingPong, Memo memo});

  @override
  $MemoCopyWith<$Res> get memo;
}

/// @nodoc
class __$$ResidentImplCopyWithImpl<$Res>
    extends _$ResidentCopyWithImpl<$Res, _$ResidentImpl>
    implements _$$ResidentImplCopyWith<$Res> {
  __$$ResidentImplCopyWithImpl(
      _$ResidentImpl _value, $Res Function(_$ResidentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Resident
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? location = null,
    Object? canPingPong = null,
    Object? memo = null,
  }) {
    return _then(_$ResidentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      canPingPong: null == canPingPong
          ? _value.canPingPong
          : canPingPong // ignore: cast_nullable_to_non_nullable
              as bool,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as Memo,
    ));
  }
}

/// @nodoc

class _$ResidentImpl extends _Resident {
  _$ResidentImpl(
      {required this.id,
      required this.name,
      required this.location,
      required this.canPingPong,
      required this.memo})
      : super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final Location location;
  @override
  final bool canPingPong;
  @override
  final Memo memo;

  @override
  String toString() {
    return 'Resident(id: $id, name: $name, location: $location, canPingPong: $canPingPong, memo: $memo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResidentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.canPingPong, canPingPong) ||
                other.canPingPong == canPingPong) &&
            (identical(other.memo, memo) || other.memo == memo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, location, canPingPong, memo);

  /// Create a copy of Resident
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResidentImplCopyWith<_$ResidentImpl> get copyWith =>
      __$$ResidentImplCopyWithImpl<_$ResidentImpl>(this, _$identity);
}

abstract class _Resident extends Resident {
  factory _Resident(
      {required final String id,
      required final String name,
      required final Location location,
      required final bool canPingPong,
      required final Memo memo}) = _$ResidentImpl;
  _Resident._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  Location get location;
  @override
  bool get canPingPong;
  @override
  Memo get memo;

  /// Create a copy of Resident
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResidentImplCopyWith<_$ResidentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Memo {
  String get data => throw _privateConstructorUsedError;
  DateTime? get time => throw _privateConstructorUsedError;

  /// Create a copy of Memo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MemoCopyWith<Memo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoCopyWith<$Res> {
  factory $MemoCopyWith(Memo value, $Res Function(Memo) then) =
      _$MemoCopyWithImpl<$Res, Memo>;
  @useResult
  $Res call({String data, DateTime? time});
}

/// @nodoc
class _$MemoCopyWithImpl<$Res, $Val extends Memo>
    implements $MemoCopyWith<$Res> {
  _$MemoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Memo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemoImplCopyWith<$Res> implements $MemoCopyWith<$Res> {
  factory _$$MemoImplCopyWith(
          _$MemoImpl value, $Res Function(_$MemoImpl) then) =
      __$$MemoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String data, DateTime? time});
}

/// @nodoc
class __$$MemoImplCopyWithImpl<$Res>
    extends _$MemoCopyWithImpl<$Res, _$MemoImpl>
    implements _$$MemoImplCopyWith<$Res> {
  __$$MemoImplCopyWithImpl(_$MemoImpl _value, $Res Function(_$MemoImpl) _then)
      : super(_value, _then);

  /// Create a copy of Memo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? time = freezed,
  }) {
    return _then(_$MemoImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$MemoImpl extends _Memo {
  _$MemoImpl({required this.data, required this.time}) : super._();

  @override
  final String data;
  @override
  final DateTime? time;

  @override
  String toString() {
    return 'Memo(data: $data, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemoImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.time, time) || other.time == time));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data, time);

  /// Create a copy of Memo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemoImplCopyWith<_$MemoImpl> get copyWith =>
      __$$MemoImplCopyWithImpl<_$MemoImpl>(this, _$identity);
}

abstract class _Memo extends Memo {
  factory _Memo({required final String data, required final DateTime? time}) =
      _$MemoImpl;
  _Memo._() : super._();

  @override
  String get data;
  @override
  DateTime? get time;

  /// Create a copy of Memo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemoImplCopyWith<_$MemoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HouseKey {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Location get location => throw _privateConstructorUsedError;
  Resident? get lastResident => throw _privateConstructorUsedError;
  DateTime? get time => throw _privateConstructorUsedError;

  /// Create a copy of HouseKey
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HouseKeyCopyWith<HouseKey> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HouseKeyCopyWith<$Res> {
  factory $HouseKeyCopyWith(HouseKey value, $Res Function(HouseKey) then) =
      _$HouseKeyCopyWithImpl<$Res, HouseKey>;
  @useResult
  $Res call(
      {String id,
      String name,
      Location location,
      Resident? lastResident,
      DateTime? time});

  $ResidentCopyWith<$Res>? get lastResident;
}

/// @nodoc
class _$HouseKeyCopyWithImpl<$Res, $Val extends HouseKey>
    implements $HouseKeyCopyWith<$Res> {
  _$HouseKeyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HouseKey
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? location = null,
    Object? lastResident = freezed,
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      lastResident: freezed == lastResident
          ? _value.lastResident
          : lastResident // ignore: cast_nullable_to_non_nullable
              as Resident?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of HouseKey
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResidentCopyWith<$Res>? get lastResident {
    if (_value.lastResident == null) {
      return null;
    }

    return $ResidentCopyWith<$Res>(_value.lastResident!, (value) {
      return _then(_value.copyWith(lastResident: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HouseKeyImplCopyWith<$Res>
    implements $HouseKeyCopyWith<$Res> {
  factory _$$HouseKeyImplCopyWith(
          _$HouseKeyImpl value, $Res Function(_$HouseKeyImpl) then) =
      __$$HouseKeyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      Location location,
      Resident? lastResident,
      DateTime? time});

  @override
  $ResidentCopyWith<$Res>? get lastResident;
}

/// @nodoc
class __$$HouseKeyImplCopyWithImpl<$Res>
    extends _$HouseKeyCopyWithImpl<$Res, _$HouseKeyImpl>
    implements _$$HouseKeyImplCopyWith<$Res> {
  __$$HouseKeyImplCopyWithImpl(
      _$HouseKeyImpl _value, $Res Function(_$HouseKeyImpl) _then)
      : super(_value, _then);

  /// Create a copy of HouseKey
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? location = null,
    Object? lastResident = freezed,
    Object? time = freezed,
  }) {
    return _then(_$HouseKeyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      lastResident: freezed == lastResident
          ? _value.lastResident
          : lastResident // ignore: cast_nullable_to_non_nullable
              as Resident?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$HouseKeyImpl extends _HouseKey {
  _$HouseKeyImpl(
      {required this.id,
      required this.name,
      required this.location,
      required this.lastResident,
      required this.time})
      : super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final Location location;
  @override
  final Resident? lastResident;
  @override
  final DateTime? time;

  @override
  String toString() {
    return 'HouseKey(id: $id, name: $name, location: $location, lastResident: $lastResident, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HouseKeyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.lastResident, lastResident) ||
                other.lastResident == lastResident) &&
            (identical(other.time, time) || other.time == time));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, location, lastResident, time);

  /// Create a copy of HouseKey
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HouseKeyImplCopyWith<_$HouseKeyImpl> get copyWith =>
      __$$HouseKeyImplCopyWithImpl<_$HouseKeyImpl>(this, _$identity);
}

abstract class _HouseKey extends HouseKey {
  factory _HouseKey(
      {required final String id,
      required final String name,
      required final Location location,
      required final Resident? lastResident,
      required final DateTime? time}) = _$HouseKeyImpl;
  _HouseKey._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  Location get location;
  @override
  Resident? get lastResident;
  @override
  DateTime? get time;

  /// Create a copy of HouseKey
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HouseKeyImplCopyWith<_$HouseKeyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
