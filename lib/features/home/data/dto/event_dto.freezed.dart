// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EventDtoTearOff {
  const _$EventDtoTearOff();

  _EventDto call(
      {String name = "Unknown",
      String imageUrl = "https://picsum.photos/id/237/200/300",
      int price = 0,
      DateTime? time,
      String address = "",
      bool isSaved = false,
      bool isTop = false}) {
    return _EventDto(
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
const $EventDto = _$EventDtoTearOff();

/// @nodoc
mixin _$EventDto {
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  DateTime? get time => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  bool get isSaved => throw _privateConstructorUsedError;
  bool get isTop => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventDtoCopyWith<EventDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventDtoCopyWith<$Res> {
  factory $EventDtoCopyWith(EventDto value, $Res Function(EventDto) then) =
      _$EventDtoCopyWithImpl<$Res>;
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
class _$EventDtoCopyWithImpl<$Res> implements $EventDtoCopyWith<$Res> {
  _$EventDtoCopyWithImpl(this._value, this._then);

  final EventDto _value;
  // ignore: unused_field
  final $Res Function(EventDto) _then;

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
abstract class _$EventDtoCopyWith<$Res> implements $EventDtoCopyWith<$Res> {
  factory _$EventDtoCopyWith(_EventDto value, $Res Function(_EventDto) then) =
      __$EventDtoCopyWithImpl<$Res>;
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
class __$EventDtoCopyWithImpl<$Res> extends _$EventDtoCopyWithImpl<$Res>
    implements _$EventDtoCopyWith<$Res> {
  __$EventDtoCopyWithImpl(_EventDto _value, $Res Function(_EventDto) _then)
      : super(_value, (v) => _then(v as _EventDto));

  @override
  _EventDto get _value => super._value as _EventDto;

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
    return _then(_EventDto(
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

class _$_EventDto implements _EventDto {
  _$_EventDto(
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
    return 'EventDto(name: $name, imageUrl: $imageUrl, price: $price, time: $time, address: $address, isSaved: $isSaved, isTop: $isTop)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EventDto &&
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
  _$EventDtoCopyWith<_EventDto> get copyWith =>
      __$EventDtoCopyWithImpl<_EventDto>(this, _$identity);
}

abstract class _EventDto implements EventDto {
  factory _EventDto(
      {String name,
      String imageUrl,
      int price,
      DateTime? time,
      String address,
      bool isSaved,
      bool isTop}) = _$_EventDto;

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
  _$EventDtoCopyWith<_EventDto> get copyWith =>
      throw _privateConstructorUsedError;
}
