// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'upcoming_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UpcomingEventTearOff {
  const _$UpcomingEventTearOff();

  _UpcomingEvent call(
      {String name = "Unknown",
      String imageUrl = "https://picsum.photos/id/237/200/300",
      String address = "",
      bool isSaved = false}) {
    return _UpcomingEvent(
      name: name,
      imageUrl: imageUrl,
      address: address,
      isSaved: isSaved,
    );
  }
}

/// @nodoc
const $UpcomingEvent = _$UpcomingEventTearOff();

/// @nodoc
mixin _$UpcomingEvent {
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  bool get isSaved => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpcomingEventCopyWith<UpcomingEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpcomingEventCopyWith<$Res> {
  factory $UpcomingEventCopyWith(
          UpcomingEvent value, $Res Function(UpcomingEvent) then) =
      _$UpcomingEventCopyWithImpl<$Res>;
  $Res call({String name, String imageUrl, String address, bool isSaved});
}

/// @nodoc
class _$UpcomingEventCopyWithImpl<$Res>
    implements $UpcomingEventCopyWith<$Res> {
  _$UpcomingEventCopyWithImpl(this._value, this._then);

  final UpcomingEvent _value;
  // ignore: unused_field
  final $Res Function(UpcomingEvent) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? address = freezed,
    Object? isSaved = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      isSaved: isSaved == freezed
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$UpcomingEventCopyWith<$Res>
    implements $UpcomingEventCopyWith<$Res> {
  factory _$UpcomingEventCopyWith(
          _UpcomingEvent value, $Res Function(_UpcomingEvent) then) =
      __$UpcomingEventCopyWithImpl<$Res>;
  @override
  $Res call({String name, String imageUrl, String address, bool isSaved});
}

/// @nodoc
class __$UpcomingEventCopyWithImpl<$Res>
    extends _$UpcomingEventCopyWithImpl<$Res>
    implements _$UpcomingEventCopyWith<$Res> {
  __$UpcomingEventCopyWithImpl(
      _UpcomingEvent _value, $Res Function(_UpcomingEvent) _then)
      : super(_value, (v) => _then(v as _UpcomingEvent));

  @override
  _UpcomingEvent get _value => super._value as _UpcomingEvent;

  @override
  $Res call({
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? address = freezed,
    Object? isSaved = freezed,
  }) {
    return _then(_UpcomingEvent(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      isSaved: isSaved == freezed
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_UpcomingEvent implements _UpcomingEvent {
  _$_UpcomingEvent(
      {this.name = "Unknown",
      this.imageUrl = "https://picsum.photos/id/237/200/300",
      this.address = "",
      this.isSaved = false});

  @JsonKey()
  @override
  final String name;
  @JsonKey()
  @override
  final String imageUrl;
  @JsonKey()
  @override
  final String address;
  @JsonKey()
  @override
  final bool isSaved;

  @override
  String toString() {
    return 'UpcomingEvent(name: $name, imageUrl: $imageUrl, address: $address, isSaved: $isSaved)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpcomingEvent &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.isSaved, isSaved));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(isSaved));

  @JsonKey(ignore: true)
  @override
  _$UpcomingEventCopyWith<_UpcomingEvent> get copyWith =>
      __$UpcomingEventCopyWithImpl<_UpcomingEvent>(this, _$identity);
}

abstract class _UpcomingEvent implements UpcomingEvent {
  factory _UpcomingEvent(
      {String name,
      String imageUrl,
      String address,
      bool isSaved}) = _$_UpcomingEvent;

  @override
  String get name;
  @override
  String get imageUrl;
  @override
  String get address;
  @override
  bool get isSaved;
  @override
  @JsonKey(ignore: true)
  _$UpcomingEventCopyWith<_UpcomingEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
