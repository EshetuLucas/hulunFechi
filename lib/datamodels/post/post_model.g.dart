// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      id: json['id'] as int,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      sectors: json['sectors'] == null
          ? null
          : Sector.fromJson(json['sectors'] as Map<String, dynamic>),
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
      platform: json['platform'] == null
          ? null
          : Platform.fromJson(json['platform'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      subCategory: json['subCategory'] == null
          ? null
          : SubCategory.fromJson(json['subCategory'] as Map<String, dynamic>),
      title: json['title'] as String,
      description: json['description'] as String,
      likes: json['likes'] as int? ?? 0,
      comments: json['comments'] as int? ?? 0,
      shares: json['shares'] as int? ?? 0,
      expiry: json['expiry'] as String?,
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'sectors': instance.sectors,
      'country': instance.country,
      'platform': instance.platform,
      'category': instance.category,
      'subCategory': instance.subCategory,
      'title': instance.title,
      'description': instance.description,
      'likes': instance.likes,
      'comments': instance.comments,
      'shares': instance.shares,
      'expiry': instance.expiry,
    };

_$_Sector _$$_SectorFromJson(Map<String, dynamic> json) => _$_Sector(
      id: json['id'] as int,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$$_SectorToJson(_$_Sector instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };

_$_Category _$$_CategoryFromJson(Map<String, dynamic> json) => _$_Category(
      id: json['id'] as int,
      name: json['name'] as String? ?? '',
      content: json['content'] as String? ?? '',
      platform: json['platform'] == null
          ? null
          : Platform.fromJson(json['platform'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CategoryToJson(_$_Category instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'content': instance.content,
      'platform': instance.platform,
    };

_$_SubCategory _$$_SubCategoryFromJson(Map<String, dynamic> json) =>
    _$_SubCategory(
      id: json['id'] as int,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SubCategoryToJson(_$_SubCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
    };

_$_Platform _$$_PlatformFromJson(Map<String, dynamic> json) => _$_Platform(
      id: json['id'] as int,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      sectors: json['sectors'] == null
          ? null
          : Sector.fromJson(json['sectors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PlatformToJson(_$_Platform instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'sectors': instance.sectors,
    };

_$_PostForm _$$_PostFormFromJson(Map<String, dynamic> json) => _$_PostForm(
      user: json['user'] as Map<String, dynamic>,
      published: json['published'] as bool? ?? false,
      platform: json['platform'] as Map<String, dynamic>,
      category: json['category'] as Map<String, dynamic>,
      subCategory: json['subCategory'] as Map<String, dynamic>,
      country: json['country'] as Map<String, dynamic>,
      sectors: json['sectors'] as Map<String, dynamic>,
      title: json['title'] as String,
      description: json['description'] as String,
      expire: json['expire'] as String?,
    );

Map<String, dynamic> _$$_PostFormToJson(_$_PostForm instance) =>
    <String, dynamic>{
      'user': instance.user,
      'published': instance.published,
      'platform': instance.platform,
      'category': instance.category,
      'subCategory': instance.subCategory,
      'country': instance.country,
      'sectors': instance.sectors,
      'title': instance.title,
      'description': instance.description,
      'expire': instance.expire,
    };
