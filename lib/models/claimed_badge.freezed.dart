// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'claimed_badge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClaimedBadge _$ClaimedBadgeFromJson(Map<String, dynamic> json) {
  return _ClaimedBadge.fromJson(json);
}

/// @nodoc
mixin _$ClaimedBadge {
  int? get id => throw _privateConstructorUsedError;
  BadgeType? get badgeType => throw _privateConstructorUsedError;
  int? get user => throw _privateConstructorUsedError;
  DateTime? get offeredOn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClaimedBadgeCopyWith<ClaimedBadge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClaimedBadgeCopyWith<$Res> {
  factory $ClaimedBadgeCopyWith(
          ClaimedBadge value, $Res Function(ClaimedBadge) then) =
      _$ClaimedBadgeCopyWithImpl<$Res, ClaimedBadge>;
  @useResult
  $Res call({int? id, BadgeType? badgeType, int? user, DateTime? offeredOn});

  $BadgeTypeCopyWith<$Res>? get badgeType;
}

/// @nodoc
class _$ClaimedBadgeCopyWithImpl<$Res, $Val extends ClaimedBadge>
    implements $ClaimedBadgeCopyWith<$Res> {
  _$ClaimedBadgeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? badgeType = freezed,
    Object? user = freezed,
    Object? offeredOn = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      badgeType: freezed == badgeType
          ? _value.badgeType
          : badgeType // ignore: cast_nullable_to_non_nullable
              as BadgeType?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as int?,
      offeredOn: freezed == offeredOn
          ? _value.offeredOn
          : offeredOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BadgeTypeCopyWith<$Res>? get badgeType {
    if (_value.badgeType == null) {
      return null;
    }

    return $BadgeTypeCopyWith<$Res>(_value.badgeType!, (value) {
      return _then(_value.copyWith(badgeType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ClaimedBadgeCopyWith<$Res>
    implements $ClaimedBadgeCopyWith<$Res> {
  factory _$$_ClaimedBadgeCopyWith(
          _$_ClaimedBadge value, $Res Function(_$_ClaimedBadge) then) =
      __$$_ClaimedBadgeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, BadgeType? badgeType, int? user, DateTime? offeredOn});

  @override
  $BadgeTypeCopyWith<$Res>? get badgeType;
}

/// @nodoc
class __$$_ClaimedBadgeCopyWithImpl<$Res>
    extends _$ClaimedBadgeCopyWithImpl<$Res, _$_ClaimedBadge>
    implements _$$_ClaimedBadgeCopyWith<$Res> {
  __$$_ClaimedBadgeCopyWithImpl(
      _$_ClaimedBadge _value, $Res Function(_$_ClaimedBadge) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? badgeType = freezed,
    Object? user = freezed,
    Object? offeredOn = freezed,
  }) {
    return _then(_$_ClaimedBadge(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      badgeType: freezed == badgeType
          ? _value.badgeType
          : badgeType // ignore: cast_nullable_to_non_nullable
              as BadgeType?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as int?,
      offeredOn: freezed == offeredOn
          ? _value.offeredOn
          : offeredOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClaimedBadge implements _ClaimedBadge {
  const _$_ClaimedBadge({this.id, this.badgeType, this.user, this.offeredOn});

  factory _$_ClaimedBadge.fromJson(Map<String, dynamic> json) =>
      _$$_ClaimedBadgeFromJson(json);

  @override
  final int? id;
  @override
  final BadgeType? badgeType;
  @override
  final int? user;
  @override
  final DateTime? offeredOn;

  @override
  String toString() {
    return 'ClaimedBadge(id: $id, badgeType: $badgeType, user: $user, offeredOn: $offeredOn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClaimedBadge &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.badgeType, badgeType) ||
                other.badgeType == badgeType) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.offeredOn, offeredOn) ||
                other.offeredOn == offeredOn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, badgeType, user, offeredOn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClaimedBadgeCopyWith<_$_ClaimedBadge> get copyWith =>
      __$$_ClaimedBadgeCopyWithImpl<_$_ClaimedBadge>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClaimedBadgeToJson(
      this,
    );
  }
}

abstract class _ClaimedBadge implements ClaimedBadge {
  const factory _ClaimedBadge(
      {final int? id,
      final BadgeType? badgeType,
      final int? user,
      final DateTime? offeredOn}) = _$_ClaimedBadge;

  factory _ClaimedBadge.fromJson(Map<String, dynamic> json) =
      _$_ClaimedBadge.fromJson;

  @override
  int? get id;
  @override
  BadgeType? get badgeType;
  @override
  int? get user;
  @override
  DateTime? get offeredOn;
  @override
  @JsonKey(ignore: true)
  _$$_ClaimedBadgeCopyWith<_$_ClaimedBadge> get copyWith =>
      throw _privateConstructorUsedError;
}

BadgeType _$BadgeTypeFromJson(Map<String, dynamic> json) {
  return _BadgeType.fromJson(json);
}

/// @nodoc
mixin _$BadgeType {
  int? get id => throw _privateConstructorUsedError;
  int? get org => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get itemCategory => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BadgeTypeCopyWith<BadgeType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BadgeTypeCopyWith<$Res> {
  factory $BadgeTypeCopyWith(BadgeType value, $Res Function(BadgeType) then) =
      _$BadgeTypeCopyWithImpl<$Res, BadgeType>;
  @useResult
  $Res call(
      {int? id,
      int? org,
      String? title,
      String? image,
      String? description,
      int? itemCategory});
}

/// @nodoc
class _$BadgeTypeCopyWithImpl<$Res, $Val extends BadgeType>
    implements $BadgeTypeCopyWith<$Res> {
  _$BadgeTypeCopyWithImpl(this._value, this._then);

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
    Object? itemCategory = freezed,
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
      itemCategory: freezed == itemCategory
          ? _value.itemCategory
          : itemCategory // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BadgeTypeCopyWith<$Res> implements $BadgeTypeCopyWith<$Res> {
  factory _$$_BadgeTypeCopyWith(
          _$_BadgeType value, $Res Function(_$_BadgeType) then) =
      __$$_BadgeTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? org,
      String? title,
      String? image,
      String? description,
      int? itemCategory});
}

/// @nodoc
class __$$_BadgeTypeCopyWithImpl<$Res>
    extends _$BadgeTypeCopyWithImpl<$Res, _$_BadgeType>
    implements _$$_BadgeTypeCopyWith<$Res> {
  __$$_BadgeTypeCopyWithImpl(
      _$_BadgeType _value, $Res Function(_$_BadgeType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? org = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? itemCategory = freezed,
  }) {
    return _then(_$_BadgeType(
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
      itemCategory: freezed == itemCategory
          ? _value.itemCategory
          : itemCategory // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BadgeType implements _BadgeType {
  const _$_BadgeType(
      {this.id,
      this.org,
      this.title,
      this.image,
      this.description,
      this.itemCategory});

  factory _$_BadgeType.fromJson(Map<String, dynamic> json) =>
      _$$_BadgeTypeFromJson(json);

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
  final int? itemCategory;

  @override
  String toString() {
    return 'BadgeType(id: $id, org: $org, title: $title, image: $image, description: $description, itemCategory: $itemCategory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BadgeType &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.org, org) || other.org == org) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.itemCategory, itemCategory) ||
                other.itemCategory == itemCategory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, org, title, image, description, itemCategory);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BadgeTypeCopyWith<_$_BadgeType> get copyWith =>
      __$$_BadgeTypeCopyWithImpl<_$_BadgeType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BadgeTypeToJson(
      this,
    );
  }
}

abstract class _BadgeType implements BadgeType {
  const factory _BadgeType(
      {final int? id,
      final int? org,
      final String? title,
      final String? image,
      final String? description,
      final int? itemCategory}) = _$_BadgeType;

  factory _BadgeType.fromJson(Map<String, dynamic> json) =
      _$_BadgeType.fromJson;

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
  int? get itemCategory;
  @override
  @JsonKey(ignore: true)
  _$$_BadgeTypeCopyWith<_$_BadgeType> get copyWith =>
      throw _privateConstructorUsedError;
}
