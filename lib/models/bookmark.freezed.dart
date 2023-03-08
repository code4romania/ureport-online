// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Bookmark _$BookmarkFromJson(Map<String, dynamic> json) {
  return _Bookmark.fromJson(json);
}

/// @nodoc
mixin _$Bookmark {
  int? get id => throw _privateConstructorUsedError;
  int? get user => throw _privateConstructorUsedError;
  Story? get story => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookmarkCopyWith<Bookmark> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarkCopyWith<$Res> {
  factory $BookmarkCopyWith(Bookmark value, $Res Function(Bookmark) then) =
      _$BookmarkCopyWithImpl<$Res, Bookmark>;
  @useResult
  $Res call({int? id, int? user, Story? story});

  $StoryCopyWith<$Res>? get story;
}

/// @nodoc
class _$BookmarkCopyWithImpl<$Res, $Val extends Bookmark>
    implements $BookmarkCopyWith<$Res> {
  _$BookmarkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? story = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as int?,
      story: freezed == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
              as Story?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StoryCopyWith<$Res>? get story {
    if (_value.story == null) {
      return null;
    }

    return $StoryCopyWith<$Res>(_value.story!, (value) {
      return _then(_value.copyWith(story: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BookmarkCopyWith<$Res> implements $BookmarkCopyWith<$Res> {
  factory _$$_BookmarkCopyWith(
          _$_Bookmark value, $Res Function(_$_Bookmark) then) =
      __$$_BookmarkCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int? user, Story? story});

  @override
  $StoryCopyWith<$Res>? get story;
}

/// @nodoc
class __$$_BookmarkCopyWithImpl<$Res>
    extends _$BookmarkCopyWithImpl<$Res, _$_Bookmark>
    implements _$$_BookmarkCopyWith<$Res> {
  __$$_BookmarkCopyWithImpl(
      _$_Bookmark _value, $Res Function(_$_Bookmark) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? story = freezed,
  }) {
    return _then(_$_Bookmark(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as int?,
      story: freezed == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
              as Story?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Bookmark implements _Bookmark {
  const _$_Bookmark({this.id, this.user, this.story});

  factory _$_Bookmark.fromJson(Map<String, dynamic> json) =>
      _$$_BookmarkFromJson(json);

  @override
  final int? id;
  @override
  final int? user;
  @override
  final Story? story;

  @override
  String toString() {
    return 'Bookmark(id: $id, user: $user, story: $story)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Bookmark &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.story, story) || other.story == story));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, user, story);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookmarkCopyWith<_$_Bookmark> get copyWith =>
      __$$_BookmarkCopyWithImpl<_$_Bookmark>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookmarkToJson(
      this,
    );
  }
}

abstract class _Bookmark implements Bookmark {
  const factory _Bookmark(
      {final int? id, final int? user, final Story? story}) = _$_Bookmark;

  factory _Bookmark.fromJson(Map<String, dynamic> json) = _$_Bookmark.fromJson;

  @override
  int? get id;
  @override
  int? get user;
  @override
  Story? get story;
  @override
  @JsonKey(ignore: true)
  _$$_BookmarkCopyWith<_$_Bookmark> get copyWith =>
      throw _privateConstructorUsedError;
}

Story _$StoryFromJson(Map<String, dynamic> json) {
  return _Story.fromJson(json);
}

/// @nodoc
mixin _$Story {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  bool? get featured => throw _privateConstructorUsedError;
  String? get summary => throw _privateConstructorUsedError;
  dynamic get videoId => throw _privateConstructorUsedError;
  dynamic get audioLink => throw _privateConstructorUsedError;
  dynamic get tags => throw _privateConstructorUsedError;
  int? get org => throw _privateConstructorUsedError;
  List<String>? get images => throw _privateConstructorUsedError;
  DateTime? get createdOn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoryCopyWith<Story> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryCopyWith<$Res> {
  factory $StoryCopyWith(Story value, $Res Function(Story) then) =
      _$StoryCopyWithImpl<$Res, Story>;
  @useResult
  $Res call(
      {int? id,
      String? title,
      bool? featured,
      String? summary,
      dynamic videoId,
      dynamic audioLink,
      dynamic tags,
      int? org,
      List<String>? images,
      DateTime? createdOn});
}

/// @nodoc
class _$StoryCopyWithImpl<$Res, $Val extends Story>
    implements $StoryCopyWith<$Res> {
  _$StoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? featured = freezed,
    Object? summary = freezed,
    Object? videoId = freezed,
    Object? audioLink = freezed,
    Object? tags = freezed,
    Object? org = freezed,
    Object? images = freezed,
    Object? createdOn = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      featured: freezed == featured
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as bool?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      videoId: freezed == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      audioLink: freezed == audioLink
          ? _value.audioLink
          : audioLink // ignore: cast_nullable_to_non_nullable
              as dynamic,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as dynamic,
      org: freezed == org
          ? _value.org
          : org // ignore: cast_nullable_to_non_nullable
              as int?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      createdOn: freezed == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StoryCopyWith<$Res> implements $StoryCopyWith<$Res> {
  factory _$$_StoryCopyWith(_$_Story value, $Res Function(_$_Story) then) =
      __$$_StoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      bool? featured,
      String? summary,
      dynamic videoId,
      dynamic audioLink,
      dynamic tags,
      int? org,
      List<String>? images,
      DateTime? createdOn});
}

/// @nodoc
class __$$_StoryCopyWithImpl<$Res> extends _$StoryCopyWithImpl<$Res, _$_Story>
    implements _$$_StoryCopyWith<$Res> {
  __$$_StoryCopyWithImpl(_$_Story _value, $Res Function(_$_Story) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? featured = freezed,
    Object? summary = freezed,
    Object? videoId = freezed,
    Object? audioLink = freezed,
    Object? tags = freezed,
    Object? org = freezed,
    Object? images = freezed,
    Object? createdOn = freezed,
  }) {
    return _then(_$_Story(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      featured: freezed == featured
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as bool?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      videoId: freezed == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      audioLink: freezed == audioLink
          ? _value.audioLink
          : audioLink // ignore: cast_nullable_to_non_nullable
              as dynamic,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as dynamic,
      org: freezed == org
          ? _value.org
          : org // ignore: cast_nullable_to_non_nullable
              as int?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      createdOn: freezed == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Story implements _Story {
  const _$_Story(
      {this.id,
      this.title,
      this.featured,
      this.summary,
      this.videoId,
      this.audioLink,
      this.tags,
      this.org,
      final List<String>? images,
      this.createdOn})
      : _images = images;

  factory _$_Story.fromJson(Map<String, dynamic> json) =>
      _$$_StoryFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final bool? featured;
  @override
  final String? summary;
  @override
  final dynamic videoId;
  @override
  final dynamic audioLink;
  @override
  final dynamic tags;
  @override
  final int? org;
  final List<String>? _images;
  @override
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? createdOn;

  @override
  String toString() {
    return 'Story(id: $id, title: $title, featured: $featured, summary: $summary, videoId: $videoId, audioLink: $audioLink, tags: $tags, org: $org, images: $images, createdOn: $createdOn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Story &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.featured, featured) ||
                other.featured == featured) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality().equals(other.videoId, videoId) &&
            const DeepCollectionEquality().equals(other.audioLink, audioLink) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            (identical(other.org, org) || other.org == org) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.createdOn, createdOn) ||
                other.createdOn == createdOn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      featured,
      summary,
      const DeepCollectionEquality().hash(videoId),
      const DeepCollectionEquality().hash(audioLink),
      const DeepCollectionEquality().hash(tags),
      org,
      const DeepCollectionEquality().hash(_images),
      createdOn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoryCopyWith<_$_Story> get copyWith =>
      __$$_StoryCopyWithImpl<_$_Story>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoryToJson(
      this,
    );
  }
}

abstract class _Story implements Story {
  const factory _Story(
      {final int? id,
      final String? title,
      final bool? featured,
      final String? summary,
      final dynamic videoId,
      final dynamic audioLink,
      final dynamic tags,
      final int? org,
      final List<String>? images,
      final DateTime? createdOn}) = _$_Story;

  factory _Story.fromJson(Map<String, dynamic> json) = _$_Story.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  bool? get featured;
  @override
  String? get summary;
  @override
  dynamic get videoId;
  @override
  dynamic get audioLink;
  @override
  dynamic get tags;
  @override
  int? get org;
  @override
  List<String>? get images;
  @override
  DateTime? get createdOn;
  @override
  @JsonKey(ignore: true)
  _$$_StoryCopyWith<_$_Story> get copyWith =>
      throw _privateConstructorUsedError;
}
