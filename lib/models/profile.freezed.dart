// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
mixin _$Profile {
  String? get username => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  ProfileClass? get profile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call(
      {String? username,
      String? email,
      String? firstName,
      String? lastName,
      ProfileClass? profile});

  $ProfileClassCopyWith<$Res>? get profile;
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? email = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? profile = freezed,
  }) {
    return _then(_value.copyWith(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileClass?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileClassCopyWith<$Res>? get profile {
    if (_value.profile == null) {
      return null;
    }

    return $ProfileClassCopyWith<$Res>(_value.profile!, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$_ProfileCopyWith(
          _$_Profile value, $Res Function(_$_Profile) then) =
      __$$_ProfileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? username,
      String? email,
      String? firstName,
      String? lastName,
      ProfileClass? profile});

  @override
  $ProfileClassCopyWith<$Res>? get profile;
}

/// @nodoc
class __$$_ProfileCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$_Profile>
    implements _$$_ProfileCopyWith<$Res> {
  __$$_ProfileCopyWithImpl(_$_Profile _value, $Res Function(_$_Profile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? email = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? profile = freezed,
  }) {
    return _then(_$_Profile(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileClass?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Profile implements _Profile {
  const _$_Profile(
      {this.username, this.email, this.firstName, this.lastName, this.profile});

  factory _$_Profile.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileFromJson(json);

  @override
  final String? username;
  @override
  final String? email;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final ProfileClass? profile;

  @override
  String toString() {
    return 'Profile(username: $username, email: $email, firstName: $firstName, lastName: $lastName, profile: $profile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Profile &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, username, email, firstName, lastName, profile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileCopyWith<_$_Profile> get copyWith =>
      __$$_ProfileCopyWithImpl<_$_Profile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileToJson(
      this,
    );
  }
}

abstract class _Profile implements Profile {
  const factory _Profile(
      {final String? username,
      final String? email,
      final String? firstName,
      final String? lastName,
      final ProfileClass? profile}) = _$_Profile;

  factory _Profile.fromJson(Map<String, dynamic> json) = _$_Profile.fromJson;

  @override
  String? get username;
  @override
  String? get email;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  ProfileClass? get profile;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileCopyWith<_$_Profile> get copyWith =>
      throw _privateConstructorUsedError;
}

ProfileClass _$ProfileClassFromJson(Map<String, dynamic> json) {
  return _ProfileClass.fromJson(json);
}

/// @nodoc
mixin _$ProfileClass {
  String? get contactUuid => throw _privateConstructorUsedError;
  dynamic get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileClassCopyWith<ProfileClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileClassCopyWith<$Res> {
  factory $ProfileClassCopyWith(
          ProfileClass value, $Res Function(ProfileClass) then) =
      _$ProfileClassCopyWithImpl<$Res, ProfileClass>;
  @useResult
  $Res call({String? contactUuid, dynamic image});
}

/// @nodoc
class _$ProfileClassCopyWithImpl<$Res, $Val extends ProfileClass>
    implements $ProfileClassCopyWith<$Res> {
  _$ProfileClassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contactUuid = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      contactUuid: freezed == contactUuid
          ? _value.contactUuid
          : contactUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProfileClassCopyWith<$Res>
    implements $ProfileClassCopyWith<$Res> {
  factory _$$_ProfileClassCopyWith(
          _$_ProfileClass value, $Res Function(_$_ProfileClass) then) =
      __$$_ProfileClassCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? contactUuid, dynamic image});
}

/// @nodoc
class __$$_ProfileClassCopyWithImpl<$Res>
    extends _$ProfileClassCopyWithImpl<$Res, _$_ProfileClass>
    implements _$$_ProfileClassCopyWith<$Res> {
  __$$_ProfileClassCopyWithImpl(
      _$_ProfileClass _value, $Res Function(_$_ProfileClass) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contactUuid = freezed,
    Object? image = freezed,
  }) {
    return _then(_$_ProfileClass(
      contactUuid: freezed == contactUuid
          ? _value.contactUuid
          : contactUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProfileClass implements _ProfileClass {
  const _$_ProfileClass({this.contactUuid, this.image});

  factory _$_ProfileClass.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileClassFromJson(json);

  @override
  final String? contactUuid;
  @override
  final dynamic image;

  @override
  String toString() {
    return 'ProfileClass(contactUuid: $contactUuid, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileClass &&
            (identical(other.contactUuid, contactUuid) ||
                other.contactUuid == contactUuid) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, contactUuid, const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileClassCopyWith<_$_ProfileClass> get copyWith =>
      __$$_ProfileClassCopyWithImpl<_$_ProfileClass>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileClassToJson(
      this,
    );
  }
}

abstract class _ProfileClass implements ProfileClass {
  const factory _ProfileClass(
      {final String? contactUuid, final dynamic image}) = _$_ProfileClass;

  factory _ProfileClass.fromJson(Map<String, dynamic> json) =
      _$_ProfileClass.fromJson;

  @override
  String? get contactUuid;
  @override
  dynamic get image;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileClassCopyWith<_$_ProfileClass> get copyWith =>
      throw _privateConstructorUsedError;
}
