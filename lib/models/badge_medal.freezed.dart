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
  BadgeType? get badge_type => throw _privateConstructorUsedError;
  int? get user => throw _privateConstructorUsedError;
  DateTime? get offered_on => throw _privateConstructorUsedError;

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
  $Res call({int? id, BadgeType? badge_type, int? user, DateTime? offered_on});

  $BadgeTypeCopyWith<$Res>? get badge_type;
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
    Object? badge_type = freezed,
    Object? user = freezed,
    Object? offered_on = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      badge_type: freezed == badge_type
          ? _value.badge_type
          : badge_type // ignore: cast_nullable_to_non_nullable
              as BadgeType?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as int?,
      offered_on: freezed == offered_on
          ? _value.offered_on
          : offered_on // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BadgeTypeCopyWith<$Res>? get badge_type {
    if (_value.badge_type == null) {
      return null;
    }

    return $BadgeTypeCopyWith<$Res>(_value.badge_type!, (value) {
      return _then(_value.copyWith(badge_type: value) as $Val);
    });
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
  $Res call({int? id, BadgeType? badge_type, int? user, DateTime? offered_on});

  @override
  $BadgeTypeCopyWith<$Res>? get badge_type;
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
    Object? badge_type = freezed,
    Object? user = freezed,
    Object? offered_on = freezed,
  }) {
    return _then(_$_BadgeMedal(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      badge_type: freezed == badge_type
          ? _value.badge_type
          : badge_type // ignore: cast_nullable_to_non_nullable
              as BadgeType?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as int?,
      offered_on: freezed == offered_on
          ? _value.offered_on
          : offered_on // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BadgeMedal implements _BadgeMedal {
  const _$_BadgeMedal({this.id, this.badge_type, this.user, this.offered_on});

  factory _$_BadgeMedal.fromJson(Map<String, dynamic> json) =>
      _$$_BadgeMedalFromJson(json);

  @override
  final int? id;
  @override
  final BadgeType? badge_type;
  @override
  final int? user;
  @override
  final DateTime? offered_on;

  @override
  String toString() {
    return 'BadgeMedal(id: $id, badge_type: $badge_type, user: $user, offered_on: $offered_on)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BadgeMedal &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.badge_type, badge_type) ||
                other.badge_type == badge_type) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.offered_on, offered_on) ||
                other.offered_on == offered_on));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, badge_type, user, offered_on);

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
      final BadgeType? badge_type,
      final int? user,
      final DateTime? offered_on}) = _$_BadgeMedal;

  factory _BadgeMedal.fromJson(Map<String, dynamic> json) =
      _$_BadgeMedal.fromJson;

  @override
  int? get id;
  @override
  BadgeType? get badge_type;
  @override
  int? get user;
  @override
  DateTime? get offered_on;
  @override
  @JsonKey(ignore: true)
  _$$_BadgeMedalCopyWith<_$_BadgeMedal> get copyWith =>
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
  dynamic get item_category => throw _privateConstructorUsedError;

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
      dynamic item_category});
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
    Object? item_category = freezed,
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
      item_category: freezed == item_category
          ? _value.item_category
          : item_category // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      dynamic item_category});
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
    Object? item_category = freezed,
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
      item_category: freezed == item_category
          ? _value.item_category
          : item_category // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      this.item_category});

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
  final dynamic item_category;

  @override
  String toString() {
    return 'BadgeType(id: $id, org: $org, title: $title, image: $image, description: $description, item_category: $item_category)';
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
            const DeepCollectionEquality()
                .equals(other.item_category, item_category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, org, title, image,
      description, const DeepCollectionEquality().hash(item_category));

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
      final dynamic item_category}) = _$_BadgeType;

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
  dynamic get item_category;
  @override
  @JsonKey(ignore: true)
  _$$_BadgeTypeCopyWith<_$_BadgeType> get copyWith =>
      throw _privateConstructorUsedError;
}
