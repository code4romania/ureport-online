// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'badge_medal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BadgeMedal _$BadgeMedalFromJson(Map<String, dynamic> json) {
  return _BadgeMedal.fromJson(json);
}

/// @nodoc
mixin _$BadgeMedal {
  int? get id => throw _privateConstructorUsedError;
  int? get org => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get validationCategory => throw _privateConstructorUsedError;
  bool? get owned => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BadgeMedalCopyWith<BadgeMedal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BadgeMedalCopyWith<$Res> {
  factory $BadgeMedalCopyWith(
          BadgeMedal value, $Res Function(BadgeMedal) then) =
      _$BadgeMedalCopyWithImpl<$Res, BadgeMedal>;
  @useResult
  $Res call(
      {int? id,
      int? org,
      String? title,
      String? image,
      String? description,
      int? validationCategory,
      bool? owned});
}

/// @nodoc
class _$BadgeMedalCopyWithImpl<$Res, $Val extends BadgeMedal>
    implements $BadgeMedalCopyWith<$Res> {
  _$BadgeMedalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? org = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? validationCategory = freezed,
    Object? owned = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      org: freezed == org
          ? _value.org
          : org // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      validationCategory: freezed == validationCategory
          ? _value.validationCategory
          : validationCategory // ignore: cast_nullable_to_non_nullable
              as int?,
      owned: freezed == owned
          ? _value.owned
          : owned // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BadgeMedalCopyWith<$Res>
    implements $BadgeMedalCopyWith<$Res> {
  factory _$$_BadgeMedalCopyWith(
          _$_BadgeMedal value, $Res Function(_$_BadgeMedal) then) =
      __$$_BadgeMedalCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? org,
      String? title,
      String? image,
      String? description,
      int? validationCategory,
      bool? owned});
}

/// @nodoc
class __$$_BadgeMedalCopyWithImpl<$Res>
    extends _$BadgeMedalCopyWithImpl<$Res, _$_BadgeMedal>
    implements _$$_BadgeMedalCopyWith<$Res> {
  __$$_BadgeMedalCopyWithImpl(
      _$_BadgeMedal _value, $Res Function(_$_BadgeMedal) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? org = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? validationCategory = freezed,
    Object? owned = freezed,
  }) {
    return _then(_$_BadgeMedal(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      org: freezed == org
          ? _value.org
          : org // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      validationCategory: freezed == validationCategory
          ? _value.validationCategory
          : validationCategory // ignore: cast_nullable_to_non_nullable
              as int?,
      owned: freezed == owned
          ? _value.owned
          : owned // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BadgeMedal implements _BadgeMedal {
  const _$_BadgeMedal(
      {this.id,
      this.org,
      this.title,
      this.image,
      this.description,
      this.validationCategory,
      this.owned});

  factory _$_BadgeMedal.fromJson(Map<String, dynamic> json) =>
      _$$_BadgeMedalFromJson(json);

  @override
  final int? id;
  @override
  final int? org;
  @override
  final String? title;
  @override
  final String? image;
  @override
  final String? description;
  @override
  final int? validationCategory;
  @override
  final bool? owned;

  @override
  String toString() {
    return 'BadgeMedal(id: $id, org: $org, title: $title, image: $image, description: $description, validationCategory: $validationCategory, owned: $owned)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BadgeMedal &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.org, org) || other.org == org) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.validationCategory, validationCategory) ||
                other.validationCategory == validationCategory) &&
            (identical(other.owned, owned) || other.owned == owned));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, org, title, image,
      description, validationCategory, owned);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BadgeMedalCopyWith<_$_BadgeMedal> get copyWith =>
      __$$_BadgeMedalCopyWithImpl<_$_BadgeMedal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BadgeMedalToJson(
      this,
    );
  }
}

abstract class _BadgeMedal implements BadgeMedal {
  const factory _BadgeMedal(
      {final int? id,
      final int? org,
      final String? title,
      final String? image,
      final String? description,
      final int? validationCategory,
      final bool? owned}) = _$_BadgeMedal;

  factory _BadgeMedal.fromJson(Map<String, dynamic> json) =
      _$_BadgeMedal.fromJson;

  @override
  int? get id;
  @override
  int? get org;
  @override
  String? get title;
  @override
  String? get image;
  @override
  String? get description;
  @override
  int? get validationCategory;
  @override
  bool? get owned;
  @override
  @JsonKey(ignore: true)
  _$$_BadgeMedalCopyWith<_$_BadgeMedal> get copyWith =>
      throw _privateConstructorUsedError;
}
