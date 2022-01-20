// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostComment _$$_PostCommentFromJson(Map<String, dynamic> json) =>
    _$_PostComment(
      id: json['id'] as int,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      comment: json['comment'] as String,
    );

Map<String, dynamic> _$$_PostCommentToJson(_$_PostComment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'comment': instance.comment,
    };
