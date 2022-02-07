// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CategoryDtoTearOff {
  const _$CategoryDtoTearOff();

  _CategoryDto call(
      {String id = "",
      String imageUrl = "https://picsum.photos/id/237/200/300",
      String name = ""}) {
    return _CategoryDto(
      id: id,
      imageUrl: imageUrl,
      name: name,
    );
  }
}

/// @nodoc
const $CategoryDto = _$CategoryDtoTearOff();

/// @nodoc
mixin _$CategoryDto {
  String get id => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryDtoCopyWith<CategoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryDtoCopyWith<$Res> {
  factory $CategoryDtoCopyWith(
          CategoryDto value, $Res Function(CategoryDto) then) =
      _$CategoryDtoCopyWithImpl<$Res>;
  $Res call({String id, String imageUrl, String name});
}

/// @nodoc
class _$CategoryDtoCopyWithImpl<$Res> implements $CategoryDtoCopyWith<$Res> {
  _$CategoryDtoCopyWithImpl(this._value, this._then);

  final CategoryDto _value;
  // ignore: unused_field
  final $Res Function(CategoryDto) _then;

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
abstract class _$CategoryDtoCopyWith<$Res>
    implements $CategoryDtoCopyWith<$Res> {
  factory _$CategoryDtoCopyWith(
          _CategoryDto value, $Res Function(_CategoryDto) then) =
      __$CategoryDtoCopyWithImpl<$Res>;
  @override
  $Res call({String id, String imageUrl, String name});
}

/// @nodoc
class __$CategoryDtoCopyWithImpl<$Res> extends _$CategoryDtoCopyWithImpl<$Res>
    implements _$CategoryDtoCopyWith<$Res> {
  __$CategoryDtoCopyWithImpl(
      _CategoryDto _value, $Res Function(_CategoryDto) _then)
      : super(_value, (v) => _then(v as _CategoryDto));

  @override
  _CategoryDto get _value => super._value as _CategoryDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? imageUrl = freezed,
    Object? name = freezed,
  }) {
    return _then(_CategoryDto(
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

class _$_CategoryDto implements _CategoryDto {
  _$_CategoryDto(
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
    return 'CategoryDto(id: $id, imageUrl: $imageUrl, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryDto &&
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
  _$CategoryDtoCopyWith<_CategoryDto> get copyWith =>
      __$CategoryDtoCopyWithImpl<_CategoryDto>(this, _$identity);
}

abstract class _CategoryDto implements CategoryDto {
  factory _CategoryDto({String id, String imageUrl, String name}) =
      _$_CategoryDto;

  @override
  String get id;
  @override
  String get imageUrl;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$CategoryDtoCopyWith<_CategoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}
