// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'trending_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TrendingEventTearOff {
  const _$TrendingEventTearOff();

  _TrendingEvent call(
      {String name = "Unknown",
      String imageUrl = "https://picsum.photos/id/237/200/300",
      int price = 0,
      DateTime? time,
      String address = "",
      bool isSaved = false,
      bool isTop = false}) {
    return _TrendingEvent(
      name: name,
      imageUrl: imageUrl,
      price: price,
      time: time,
      address: address,
      isSaved: isSaved,
      isTop: isTop,
    );
  }
}

/// @nodoc
const $TrendingEvent = _$TrendingEventTearOff();

/// @nodoc
mixin _$TrendingEvent {
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  DateTime? get time => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  bool get isSaved => throw _privateConstructorUsedError;
  bool get isTop => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TrendingEventCopyWith<TrendingEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrendingEventCopyWith<$Res> {
  factory $TrendingEventCopyWith(
          TrendingEvent value, $Res Function(TrendingEvent) then) =
      _$TrendingEventCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String imageUrl,
      int price,
      DateTime? time,
      String address,
      bool isSaved,
      bool isTop});
}

/// @nodoc
class _$TrendingEventCopyWithImpl<$Res>
    implements $TrendingEventCopyWith<$Res> {
  _$TrendingEventCopyWithImpl(this._value, this._then);

  final TrendingEvent _value;
  // ignore: unused_field
  final $Res Function(TrendingEvent) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? price = freezed,
    Object? time = freezed,
    Object? address = freezed,
    Object? isSaved = freezed,
    Object? isTop = freezed,
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
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      isSaved: isSaved == freezed
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
      isTop: isTop == freezed
          ? _value.isTop
          : isTop // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$TrendingEventCopyWith<$Res>
    implements $TrendingEventCopyWith<$Res> {
  factory _$TrendingEventCopyWith(
          _TrendingEvent value, $Res Function(_TrendingEvent) then) =
      __$TrendingEventCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String imageUrl,
      int price,
      DateTime? time,
      String address,
      bool isSaved,
      bool isTop});
}

/// @nodoc
class __$TrendingEventCopyWithImpl<$Res>
    extends _$TrendingEventCopyWithImpl<$Res>
    implements _$TrendingEventCopyWith<$Res> {
  __$TrendingEventCopyWithImpl(
      _TrendingEvent _value, $Res Function(_TrendingEvent) _then)
      : super(_value, (v) => _then(v as _TrendingEvent));

  @override
  _TrendingEvent get _value => super._value as _TrendingEvent;

  @override
  $Res call({
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? price = freezed,
    Object? time = freezed,
    Object? address = freezed,
    Object? isSaved = freezed,
    Object? isTop = freezed,
  }) {
    return _then(_TrendingEvent(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      isSaved: isSaved == freezed
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
      isTop: isTop == freezed
          ? _value.isTop
          : isTop // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TrendingEvent implements _TrendingEvent {
  _$_TrendingEvent(
      {this.name = "Unknown",
      this.imageUrl = "https://picsum.photos/id/237/200/300",
      this.price = 0,
      this.time,
      this.address = "",
      this.isSaved = false,
      this.isTop = false});

  @JsonKey()
  @override
  final String name;
  @JsonKey()
  @override
  final String imageUrl;
  @JsonKey()
  @override
  final int price;
  @override
  final DateTime? time;
  @JsonKey()
  @override
  final String address;
  @JsonKey()
  @override
  final bool isSaved;
  @JsonKey()
  @override
  final bool isTop;

  @override
  String toString() {
    return 'TrendingEvent(name: $name, imageUrl: $imageUrl, price: $price, time: $time, address: $address, isSaved: $isSaved, isTop: $isTop)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TrendingEvent &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.isSaved, isSaved) &&
            const DeepCollectionEquality().equals(other.isTop, isTop));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(isSaved),
      const DeepCollectionEquality().hash(isTop));

  @JsonKey(ignore: true)
  @override
  _$TrendingEventCopyWith<_TrendingEvent> get copyWith =>
      __$TrendingEventCopyWithImpl<_TrendingEvent>(this, _$identity);
}

abstract class _TrendingEvent implements TrendingEvent {
  factory _TrendingEvent(
      {String name,
      String imageUrl,
      int price,
      DateTime? time,
      String address,
      bool isSaved,
      bool isTop}) = _$_TrendingEvent;

  @override
  String get name;
  @override
  String get imageUrl;
  @override
  int get price;
  @override
  DateTime? get time;
  @override
  String get address;
  @override
  bool get isSaved;
  @override
  bool get isTop;
  @override
  @JsonKey(ignore: true)
  _$TrendingEventCopyWith<_TrendingEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
