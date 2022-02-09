// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'interest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$InterestTearOff {
  const _$InterestTearOff();

  _Interest call(
      {String id = "",
      String imageUrl = "https://picsum.photos/id/237/200/300",
      String name = ""}) {
    return _Interest(
      id: id,
      imageUrl: imageUrl,
      name: name,
    );
  }
}

/// @nodoc
const $Interest = _$InterestTearOff();

/// @nodoc
mixin _$Interest {
  String get id => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InterestCopyWith<Interest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InterestCopyWith<$Res> {
  factory $InterestCopyWith(Interest value, $Res Function(Interest) then) =
      _$InterestCopyWithImpl<$Res>;
  $Res call({String id, String imageUrl, String name});
}

/// @nodoc
class _$InterestCopyWithImpl<$Res> implements $InterestCopyWith<$Res> {
  _$InterestCopyWithImpl(this._value, this._then);

  final Interest _value;
  // ignore: unused_field
  final $Res Function(Interest) _then;

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
abstract class _$InterestCopyWith<$Res> implements $InterestCopyWith<$Res> {
  factory _$InterestCopyWith(_Interest value, $Res Function(_Interest) then) =
      __$InterestCopyWithImpl<$Res>;
  @override
  $Res call({String id, String imageUrl, String name});
}

/// @nodoc
class __$InterestCopyWithImpl<$Res> extends _$InterestCopyWithImpl<$Res>
    implements _$InterestCopyWith<$Res> {
  __$InterestCopyWithImpl(_Interest _value, $Res Function(_Interest) _then)
      : super(_value, (v) => _then(v as _Interest));

  @override
  _Interest get _value => super._value as _Interest;

  @override
  $Res call({
    Object? id = freezed,
    Object? imageUrl = freezed,
    Object? name = freezed,
  }) {
    return _then(_Interest(
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

class _$_Interest implements _Interest {
  _$_Interest(
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
    return 'Interest(id: $id, imageUrl: $imageUrl, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Interest &&
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
  _$InterestCopyWith<_Interest> get copyWith =>
      __$InterestCopyWithImpl<_Interest>(this, _$identity);
}

abstract class _Interest implements Interest {
  factory _Interest({String id, String imageUrl, String name}) = _$_Interest;

  @override
  String get id;
  @override
  String get imageUrl;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$InterestCopyWith<_Interest> get copyWith =>
      throw _privateConstructorUsedError;
}
