import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hulunfechi/datamodels/app_data_model.dart';
import 'package:hulunfechi/datamodels/user/user_model.dart';
part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

@freezed
class PostComment with _$PostComment {
  PostComment._();
  factory PostComment(
      {required int id,
      required User user,
      required String comment}) = _PostComment;

  factory PostComment.fromJson(Map<String, dynamic> json) =>
      _$PostCommentFromJson(json);
}
