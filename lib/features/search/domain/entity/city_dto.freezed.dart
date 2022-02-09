// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'city_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CityDtoTearOff {
  const _$CityDtoTearOff();

  _CityDto call(
      {String id = "",
      String imageUrl = "https://picsum.photos/id/237/200/300",
      String name = ""}) {
    return _CityDto(
      id: id,
      imageUrl: imageUrl,
      name: name,
    );
  }
}

/// @nodoc
const $CityDto = _$CityDtoTearOff();

/// @nodoc
mixin _$CityDto {
  String get id => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CityDtoCopyWith<CityDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityDtoCopyWith<$Res> {
  factory $CityDtoCopyWith(CityDto value, $Res Function(CityDto) then) =
      _$CityDtoCopyWithImpl<$Res>;
  $Res call({String id, String imageUrl, String name});
}

/// @nodoc
class _$CityDtoCopyWithImpl<$Res> implements $CityDtoCopyWith<$Res> {
  _$CityDtoCopyWithImpl(this._value, this._then);

  final CityDto _value;
  // ignore: unused_field
  final $Res Function(CityDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? imageUrl = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CityDtoCopyWith<$Res> implements $CityDtoCopyWith<$Res> {
  factory _$CityDtoCopyWith(_CityDto value, $Res Function(_CityDto) then) =
      __$CityDtoCopyWithImpl<$Res>;
  @override
  $Res call({String id, String imageUrl, String name});
}

/// @nodoc
class __$CityDtoCopyWithImpl<$Res> extends _$CityDtoCopyWithImpl<$Res>
    implements _$CityDtoCopyWith<$Res> {
  __$CityDtoCopyWithImpl(_CityDto _value, $Res Function(_CityDto) _then)
      : super(_value, (v) => _then(v as _CityDto));

  @override
  _CityDto get _value => super._value as _CityDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? imageUrl = freezed,
    Object? name = freezed,
  }) {
    return _then(_CityDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CityDto implements _CityDto {
  _$_CityDto(
      {this.id = "",
      this.imageUrl = "https://picsum.photos/id/237/200/300",
      this.name = ""});

  @JsonKey()
  @override
  final String id;
  @JsonKey()
  @override
  final String imageUrl;
  @JsonKey()
  @override
  final String name;

  @override
  String toString() {
    return 'CityDto(id: $id, imageUrl: $imageUrl, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CityDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$CityDtoCopyWith<_CityDto> get copyWith =>
      __$CityDtoCopyWithImpl<_CityDto>(this, _$identity);
}

abstract class _CityDto implements CityDto {
  factory _CityDto({String id, String imageUrl, String name}) = _$_CityDto;

  @override
  String get id;
  @override
  String get imageUrl;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$CityDtoCopyWith<_CityDto> get copyWith =>
      throw _privateConstructorUsedError;
}
