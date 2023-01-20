// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoryModel _$$_StoryModelFromJson(Map json) => _$_StoryModel(
      count: json['count'] as int?,
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_StoryModelToJson(_$_StoryModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results?.map((e) => e.toJson()).toList(),
    };

_$_Result _$$_ResultFromJson(Map json) => _$_Result(
      id: json['id'] as int?,
      title: json['title'] as String?,
      featured: json['featured'] as bool?,
      summary: json['summary'] as String?,
      content: json['content'] as String?,
      videoId: json['videoId'] as String?,
      audioLink: json['audioLink'],
      tags: json['tags'] as String?,
      org: json['org'] as int?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      category: json['category'] == null
          ? null
          : Category.fromJson(
              Map<String, dynamic>.from(json['category'] as Map)),
      createdOn: json['createdOn'] == null
          ? null
          : DateTime.parse(json['createdOn'] as String),
    );

Map<String, dynamic> _$$_ResultToJson(_$_Result instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'featured': instance.featured,
      'summary': instance.summary,
      'content': instance.content,
      'videoId': instance.videoId,
      'audioLink': instance.audioLink,
      'tags': instance.tags,
      'org': instance.org,
      'images': instance.images,
      'category': instance.category?.toJson(),
      'createdOn': instance.createdOn?.toIso8601String(),
    };

_$_Category _$$_CategoryFromJson(Map json) => _$_Category(
      imageUrl: json['imageUrl'],
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_CategoryToJson(_$_Category instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'name': instance.name,
    };
