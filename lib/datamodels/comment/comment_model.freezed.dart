// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostComment _$PostCommentFromJson(Map<String, dynamic> json) {
  return _PostComment.fromJson(json);
}

/// @nodoc
class _$PostCommentTearOff {
  const _$PostCommentTearOff();

  _PostComment call(
      {required int id, required User user, required String comment}) {
    return _PostComment(
      id: id,
      user: user,
      comment: comment,
    );
  }

  PostComment fromJson(Map<String, Object?> json) {
    return PostComment.fromJson(json);
  }
}

/// @nodoc
const $PostComment = _$PostCommentTearOff();

/// @nodoc
mixin _$PostComment {
  int get id => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCommentCopyWith<PostComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCommentCopyWith<$Res> {
  factory $PostCommentCopyWith(
          PostComment value, $Res Function(PostComment) then) =
      _$PostCommentCopyWithImpl<$Res>;
  $Res call({int id, User user, String comment});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$PostCommentCopyWithImpl<$Res> implements $PostCommentCopyWith<$Res> {
  _$PostCommentCopyWithImpl(this._value, this._then);

  final PostComment _value;
  // ignore: unused_field
  final $Res Function(PostComment) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? comment = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$PostCommentCopyWith<$Res>
    implements $PostCommentCopyWith<$Res> {
  factory _$PostCommentCopyWith(
          _PostComment value, $Res Function(_PostComment) then) =
      __$PostCommentCopyWithImpl<$Res>;
  @override
  $Res call({int id, User user, String comment});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$PostCommentCopyWithImpl<$Res> extends _$PostCommentCopyWithImpl<$Res>
    implements _$PostCommentCopyWith<$Res> {
  __$PostCommentCopyWithImpl(
      _PostComment _value, $Res Function(_PostComment) _then)
      : super(_value, (v) => _then(v as _PostComment));

  @override
  _PostComment get _value => super._value as _PostComment;

  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? comment = freezed,
  }) {
    return _then(_PostComment(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostComment extends _PostComment {
  _$_PostComment({required this.id, required this.user, required this.comment})
      : super._();

  factory _$_PostComment.fromJson(Map<String, dynamic> json) =>
      _$$_PostCommentFromJson(json);

  @override
  final int id;
  @override
  final User user;
  @override
  final String comment;

  @override
  String toString() {
    return 'PostComment(id: $id, user: $user, comment: $comment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostComment &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.comment, comment));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(comment));

  @JsonKey(ignore: true)
  @override
  _$PostCommentCopyWith<_PostComment> get copyWith =>
      __$PostCommentCopyWithImpl<_PostComment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostCommentToJson(this);
  }
}

abstract class _PostComment extends PostComment {
  factory _PostComment(
      {required int id,
      required User user,
      required String comment}) = _$_PostComment;
  _PostComment._() : super._();

  factory _PostComment.fromJson(Map<String, dynamic> json) =
      _$_PostComment.fromJson;

  @override
  int get id;
  @override
  User get user;
  @override
  String get comment;
  @override
  @JsonKey(ignore: true)
  _$PostCommentCopyWith<_PostComment> get copyWith =>
      throw _privateConstructorUsedError;
}
