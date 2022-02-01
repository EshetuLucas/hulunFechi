import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hulunfechi/datamodels/app_data_model.dart';
import 'package:hulunfechi/datamodels/user/user_model.dart';
part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class Post with _$Post {
  Post._();
  factory Post({
    required int id,
    required User user,
    Sector? sectors,
    Country? country,
    Platform? platform,
    Category? category,
    SubCategory? subCategory,
    required String title,
    required String description,
    @Default(0) int likes,
    @Default(0) int comments,
    @Default(0) int shares,
    String? expiry,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

@freezed
class Sector with _$Sector {
  factory Sector({
    required int id,
    @Default('') String name,
    @Default('') String description,
  }) = _Sector;

  factory Sector.fromJson(Map<String, dynamic> json) => _$SectorFromJson(json);
}

@freezed
class Category with _$Category {
  factory Category({
    required int id,
    @Default('') String name,
    @Default('') String content,
    Platform? platform,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@freezed
class SubCategory with _$SubCategory {
  factory SubCategory({
    required int id,
    @Default('') String name,
    @Default('') String description,
    Category? category,
  }) = _SubCategory;

  factory SubCategory.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryFromJson(json);
}

@freezed
class Platform with _$Platform {
  factory Platform({
    required int id,
    @Default('') String name,
    @Default('') String description,
    Sector? sectors,
  }) = _Platform;

  factory Platform.fromJson(Map<String, dynamic> json) =>
      _$PlatformFromJson(json);
}

@freezed
class PostForm with _$PostForm {
  PostForm._();
  factory PostForm({
    required Map<String, dynamic> user,
    @Default(false) bool published,
    required Map<String, dynamic> platform,
    required Map<String, dynamic> category,
    required Map<String, dynamic> subCategory,
    required Map<String, dynamic> country,
    required Map<String, dynamic> sectors,
    required String title,
    required String description,
    String? expire,
  }) = _PostForm;

  factory PostForm.fromJson(Map<String, dynamic> json) =>
      _$PostFormFromJson(json);
}
