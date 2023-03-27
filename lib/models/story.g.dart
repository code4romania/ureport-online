// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Story _$$_StoryFromJson(Map json) => _$_Story(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => StoryItem.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_StoryToJson(_$_Story instance) => <String, dynamic>{
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
      written_by: json['written_by'] as String?,
      videoId: json['videoId'],
      audioLink: json['audioLink'],
      tags: json['tags'],
      org: json['org'] as int?,
      images: json['images'] as List<dynamic>?,
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
      'written_by': instance.written_by,
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
