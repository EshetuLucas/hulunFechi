// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
class _$PostTearOff {
  const _$PostTearOff();

  _Post call(
      {required int id,
      required User user,
      Sector? sectors,
      Country? country,
      Platform? platform,
      Category? category,
      SubCategory? subCategory,
      required String title,
      required String description,
      int likes = 0,
      int comments = 0,
      int shares = 0,
      String? expiry}) {
    return _Post(
      id: id,
      user: user,
      sectors: sectors,
      country: country,
      platform: platform,
      category: category,
      subCategory: subCategory,
      title: title,
      description: description,
      likes: likes,
      comments: comments,
      shares: shares,
      expiry: expiry,
    );
  }

  Post fromJson(Map<String, Object?> json) {
    return Post.fromJson(json);
  }
}

/// @nodoc
const $Post = _$PostTearOff();

/// @nodoc
mixin _$Post {
  int get id => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  Sector? get sectors => throw _privateConstructorUsedError;
  Country? get country => throw _privateConstructorUsedError;
  Platform? get platform => throw _privateConstructorUsedError;
  Category? get category => throw _privateConstructorUsedError;
  SubCategory? get subCategory => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get likes => throw _privateConstructorUsedError;
  int get comments => throw _privateConstructorUsedError;
  int get shares => throw _privateConstructorUsedError;
  String? get expiry => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res>;
  $Res call(
      {int id,
      User user,
      Sector? sectors,
      Country? country,
      Platform? platform,
      Category? category,
      SubCategory? subCategory,
      String title,
      String description,
      int likes,
      int comments,
      int shares,
      String? expiry});

  $UserCopyWith<$Res> get user;
  $SectorCopyWith<$Res>? get sectors;
  $CountryCopyWith<$Res>? get country;
  $PlatformCopyWith<$Res>? get platform;
  $CategoryCopyWith<$Res>? get category;
  $SubCategoryCopyWith<$Res>? get subCategory;
}

/// @nodoc
class _$PostCopyWithImpl<$Res> implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  final Post _value;
  // ignore: unused_field
  final $Res Function(Post) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? sectors = freezed,
    Object? country = freezed,
    Object? platform = freezed,
    Object? category = freezed,
    Object? subCategory = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? likes = freezed,
    Object? comments = freezed,
    Object? shares = freezed,
    Object? expiry = freezed,
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
      sectors: sectors == freezed
          ? _value.sectors
          : sectors // ignore: cast_nullable_to_non_nullable
              as Sector?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country?,
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as Platform?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      subCategory: subCategory == freezed
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as SubCategory?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as int,
      shares: shares == freezed
          ? _value.shares
          : shares // ignore: cast_nullable_to_non_nullable
              as int,
      expiry: expiry == freezed
          ? _value.expiry
          : expiry // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  @override
  $SectorCopyWith<$Res>? get sectors {
    if (_value.sectors == null) {
      return null;
    }

    return $SectorCopyWith<$Res>(_value.sectors!, (value) {
      return _then(_value.copyWith(sectors: value));
    });
  }

  @override
  $CountryCopyWith<$Res>? get country {
    if (_value.country == null) {
      return null;
    }

    return $CountryCopyWith<$Res>(_value.country!, (value) {
      return _then(_value.copyWith(country: value));
    });
  }

  @override
  $PlatformCopyWith<$Res>? get platform {
    if (_value.platform == null) {
      return null;
    }

    return $PlatformCopyWith<$Res>(_value.platform!, (value) {
      return _then(_value.copyWith(platform: value));
    });
  }

  @override
  $CategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value));
    });
  }

  @override
  $SubCategoryCopyWith<$Res>? get subCategory {
    if (_value.subCategory == null) {
      return null;
    }

    return $SubCategoryCopyWith<$Res>(_value.subCategory!, (value) {
      return _then(_value.copyWith(subCategory: value));
    });
  }
}

/// @nodoc
abstract class _$PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$PostCopyWith(_Post value, $Res Function(_Post) then) =
      __$PostCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      User user,
      Sector? sectors,
      Country? country,
      Platform? platform,
      Category? category,
      SubCategory? subCategory,
      String title,
      String description,
      int likes,
      int comments,
      int shares,
      String? expiry});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $SectorCopyWith<$Res>? get sectors;
  @override
  $CountryCopyWith<$Res>? get country;
  @override
  $PlatformCopyWith<$Res>? get platform;
  @override
  $CategoryCopyWith<$Res>? get category;
  @override
  $SubCategoryCopyWith<$Res>? get subCategory;
}

/// @nodoc
class __$PostCopyWithImpl<$Res> extends _$PostCopyWithImpl<$Res>
    implements _$PostCopyWith<$Res> {
  __$PostCopyWithImpl(_Post _value, $Res Function(_Post) _then)
      : super(_value, (v) => _then(v as _Post));

  @override
  _Post get _value => super._value as _Post;

  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? sectors = freezed,
    Object? country = freezed,
    Object? platform = freezed,
    Object? category = freezed,
    Object? subCategory = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? likes = freezed,
    Object? comments = freezed,
    Object? shares = freezed,
    Object? expiry = freezed,
  }) {
    return _then(_Post(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      sectors: sectors == freezed
          ? _value.sectors
          : sectors // ignore: cast_nullable_to_non_nullable
              as Sector?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country?,
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as Platform?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      subCategory: subCategory == freezed
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as SubCategory?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as int,
      shares: shares == freezed
          ? _value.shares
          : shares // ignore: cast_nullable_to_non_nullable
              as int,
      expiry: expiry == freezed
          ? _value.expiry
          : expiry // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Post extends _Post {
  _$_Post(
      {required this.id,
      required this.user,
      this.sectors,
      this.country,
      this.platform,
      this.category,
      this.subCategory,
      required this.title,
      required this.description,
      this.likes = 0,
      this.comments = 0,
      this.shares = 0,
      this.expiry})
      : super._();

  factory _$_Post.fromJson(Map<String, dynamic> json) => _$$_PostFromJson(json);

  @override
  final int id;
  @override
  final User user;
  @override
  final Sector? sectors;
  @override
  final Country? country;
  @override
  final Platform? platform;
  @override
  final Category? category;
  @override
  final SubCategory? subCategory;
  @override
  final String title;
  @override
  final String description;
  @JsonKey()
  @override
  final int likes;
  @JsonKey()
  @override
  final int comments;
  @JsonKey()
  @override
  final int shares;
  @override
  final String? expiry;

  @override
  String toString() {
    return 'Post(id: $id, user: $user, sectors: $sectors, country: $country, platform: $platform, category: $category, subCategory: $subCategory, title: $title, description: $description, likes: $likes, comments: $comments, shares: $shares, expiry: $expiry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Post &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.sectors, sectors) &&
            const DeepCollectionEquality().equals(other.country, country) &&
            const DeepCollectionEquality().equals(other.platform, platform) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality()
                .equals(other.subCategory, subCategory) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.likes, likes) &&
            const DeepCollectionEquality().equals(other.comments, comments) &&
            const DeepCollectionEquality().equals(other.shares, shares) &&
            const DeepCollectionEquality().equals(other.expiry, expiry));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(sectors),
      const DeepCollectionEquality().hash(country),
      const DeepCollectionEquality().hash(platform),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(subCategory),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(likes),
      const DeepCollectionEquality().hash(comments),
      const DeepCollectionEquality().hash(shares),
      const DeepCollectionEquality().hash(expiry));

  @JsonKey(ignore: true)
  @override
  _$PostCopyWith<_Post> get copyWith =>
      __$PostCopyWithImpl<_Post>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostToJson(this);
  }
}

abstract class _Post extends Post {
  factory _Post(
      {required int id,
      required User user,
      Sector? sectors,
      Country? country,
      Platform? platform,
      Category? category,
      SubCategory? subCategory,
      required String title,
      required String description,
      int likes,
      int comments,
      int shares,
      String? expiry}) = _$_Post;
  _Post._() : super._();

  factory _Post.fromJson(Map<String, dynamic> json) = _$_Post.fromJson;

  @override
  int get id;
  @override
  User get user;
  @override
  Sector? get sectors;
  @override
  Country? get country;
  @override
  Platform? get platform;
  @override
  Category? get category;
  @override
  SubCategory? get subCategory;
  @override
  String get title;
  @override
  String get description;
  @override
  int get likes;
  @override
  int get comments;
  @override
  int get shares;
  @override
  String? get expiry;
  @override
  @JsonKey(ignore: true)
  _$PostCopyWith<_Post> get copyWith => throw _privateConstructorUsedError;
}

Sector _$SectorFromJson(Map<String, dynamic> json) {
  return _Sector.fromJson(json);
}

/// @nodoc
class _$SectorTearOff {
  const _$SectorTearOff();

  _Sector call({required int id, String name = '', String description = ''}) {
    return _Sector(
      id: id,
      name: name,
      description: description,
    );
  }

  Sector fromJson(Map<String, Object?> json) {
    return Sector.fromJson(json);
  }
}

/// @nodoc
const $Sector = _$SectorTearOff();

/// @nodoc
mixin _$Sector {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SectorCopyWith<Sector> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SectorCopyWith<$Res> {
  factory $SectorCopyWith(Sector value, $Res Function(Sector) then) =
      _$SectorCopyWithImpl<$Res>;
  $Res call({int id, String name, String description});
}

/// @nodoc
class _$SectorCopyWithImpl<$Res> implements $SectorCopyWith<$Res> {
  _$SectorCopyWithImpl(this._value, this._then);

  final Sector _value;
  // ignore: unused_field
  final $Res Function(Sector) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SectorCopyWith<$Res> implements $SectorCopyWith<$Res> {
  factory _$SectorCopyWith(_Sector value, $Res Function(_Sector) then) =
      __$SectorCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, String description});
}

/// @nodoc
class __$SectorCopyWithImpl<$Res> extends _$SectorCopyWithImpl<$Res>
    implements _$SectorCopyWith<$Res> {
  __$SectorCopyWithImpl(_Sector _value, $Res Function(_Sector) _then)
      : super(_value, (v) => _then(v as _Sector));

  @override
  _Sector get _value => super._value as _Sector;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
  }) {
    return _then(_Sector(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Sector implements _Sector {
  _$_Sector({required this.id, this.name = '', this.description = ''});

  factory _$_Sector.fromJson(Map<String, dynamic> json) =>
      _$$_SectorFromJson(json);

  @override
  final int id;
  @JsonKey()
  @override
  final String name;
  @JsonKey()
  @override
  final String description;

  @override
  String toString() {
    return 'Sector(id: $id, name: $name, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sector &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$SectorCopyWith<_Sector> get copyWith =>
      __$SectorCopyWithImpl<_Sector>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SectorToJson(this);
  }
}

abstract class _Sector implements Sector {
  factory _Sector({required int id, String name, String description}) =
      _$_Sector;

  factory _Sector.fromJson(Map<String, dynamic> json) = _$_Sector.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$SectorCopyWith<_Sector> get copyWith => throw _privateConstructorUsedError;
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
class _$CategoryTearOff {
  const _$CategoryTearOff();

  _Category call(
      {required int id,
      String name = '',
      String content = '',
      Sector? sectors,
      Platform? platform}) {
    return _Category(
      id: id,
      name: name,
      content: content,
      sectors: sectors,
      platform: platform,
    );
  }

  Category fromJson(Map<String, Object?> json) {
    return Category.fromJson(json);
  }
}

/// @nodoc
const $Category = _$CategoryTearOff();

/// @nodoc
mixin _$Category {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  Sector? get sectors => throw _privateConstructorUsedError;
  Platform? get platform => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String content,
      Sector? sectors,
      Platform? platform});

  $SectorCopyWith<$Res>? get sectors;
  $PlatformCopyWith<$Res>? get platform;
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res> implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  final Category _value;
  // ignore: unused_field
  final $Res Function(Category) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? content = freezed,
    Object? sectors = freezed,
    Object? platform = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      sectors: sectors == freezed
          ? _value.sectors
          : sectors // ignore: cast_nullable_to_non_nullable
              as Sector?,
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as Platform?,
    ));
  }

  @override
  $SectorCopyWith<$Res>? get sectors {
    if (_value.sectors == null) {
      return null;
    }

    return $SectorCopyWith<$Res>(_value.sectors!, (value) {
      return _then(_value.copyWith(sectors: value));
    });
  }

  @override
  $PlatformCopyWith<$Res>? get platform {
    if (_value.platform == null) {
      return null;
    }

    return $PlatformCopyWith<$Res>(_value.platform!, (value) {
      return _then(_value.copyWith(platform: value));
    });
  }
}

/// @nodoc
abstract class _$CategoryCopyWith<$Res> implements $CategoryCopyWith<$Res> {
  factory _$CategoryCopyWith(_Category value, $Res Function(_Category) then) =
      __$CategoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String content,
      Sector? sectors,
      Platform? platform});

  @override
  $SectorCopyWith<$Res>? get sectors;
  @override
  $PlatformCopyWith<$Res>? get platform;
}

/// @nodoc
class __$CategoryCopyWithImpl<$Res> extends _$CategoryCopyWithImpl<$Res>
    implements _$CategoryCopyWith<$Res> {
  __$CategoryCopyWithImpl(_Category _value, $Res Function(_Category) _then)
      : super(_value, (v) => _then(v as _Category));

  @override
  _Category get _value => super._value as _Category;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? content = freezed,
    Object? sectors = freezed,
    Object? platform = freezed,
  }) {
    return _then(_Category(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      sectors: sectors == freezed
          ? _value.sectors
          : sectors // ignore: cast_nullable_to_non_nullable
              as Sector?,
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as Platform?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Category implements _Category {
  _$_Category(
      {required this.id,
      this.name = '',
      this.content = '',
      this.sectors,
      this.platform});

  factory _$_Category.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryFromJson(json);

  @override
  final int id;
  @JsonKey()
  @override
  final String name;
  @JsonKey()
  @override
  final String content;
  @override
  final Sector? sectors;
  @override
  final Platform? platform;

  @override
  String toString() {
    return 'Category(id: $id, name: $name, content: $content, sectors: $sectors, platform: $platform)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Category &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.sectors, sectors) &&
            const DeepCollectionEquality().equals(other.platform, platform));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(sectors),
      const DeepCollectionEquality().hash(platform));

  @JsonKey(ignore: true)
  @override
  _$CategoryCopyWith<_Category> get copyWith =>
      __$CategoryCopyWithImpl<_Category>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryToJson(this);
  }
}

abstract class _Category implements Category {
  factory _Category(
      {required int id,
      String name,
      String content,
      Sector? sectors,
      Platform? platform}) = _$_Category;

  factory _Category.fromJson(Map<String, dynamic> json) = _$_Category.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get content;
  @override
  Sector? get sectors;
  @override
  Platform? get platform;
  @override
  @JsonKey(ignore: true)
  _$CategoryCopyWith<_Category> get copyWith =>
      throw _privateConstructorUsedError;
}

SubCategory _$SubCategoryFromJson(Map<String, dynamic> json) {
  return _SubCategory.fromJson(json);
}

/// @nodoc
class _$SubCategoryTearOff {
  const _$SubCategoryTearOff();

  _SubCategory call(
      {required int id,
      String name = '',
      String description = '',
      Sector? sectors,
      Platform? platform,
      Category? category}) {
    return _SubCategory(
      id: id,
      name: name,
      description: description,
      sectors: sectors,
      platform: platform,
      category: category,
    );
  }

  SubCategory fromJson(Map<String, Object?> json) {
    return SubCategory.fromJson(json);
  }
}

/// @nodoc
const $SubCategory = _$SubCategoryTearOff();

/// @nodoc
mixin _$SubCategory {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Sector? get sectors => throw _privateConstructorUsedError;
  Platform? get platform => throw _privateConstructorUsedError;
  Category? get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubCategoryCopyWith<SubCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubCategoryCopyWith<$Res> {
  factory $SubCategoryCopyWith(
          SubCategory value, $Res Function(SubCategory) then) =
      _$SubCategoryCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String description,
      Sector? sectors,
      Platform? platform,
      Category? category});

  $SectorCopyWith<$Res>? get sectors;
  $PlatformCopyWith<$Res>? get platform;
  $CategoryCopyWith<$Res>? get category;
}

/// @nodoc
class _$SubCategoryCopyWithImpl<$Res> implements $SubCategoryCopyWith<$Res> {
  _$SubCategoryCopyWithImpl(this._value, this._then);

  final SubCategory _value;
  // ignore: unused_field
  final $Res Function(SubCategory) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? sectors = freezed,
    Object? platform = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      sectors: sectors == freezed
          ? _value.sectors
          : sectors // ignore: cast_nullable_to_non_nullable
              as Sector?,
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as Platform?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
    ));
  }

  @override
  $SectorCopyWith<$Res>? get sectors {
    if (_value.sectors == null) {
      return null;
    }

    return $SectorCopyWith<$Res>(_value.sectors!, (value) {
      return _then(_value.copyWith(sectors: value));
    });
  }

  @override
  $PlatformCopyWith<$Res>? get platform {
    if (_value.platform == null) {
      return null;
    }

    return $PlatformCopyWith<$Res>(_value.platform!, (value) {
      return _then(_value.copyWith(platform: value));
    });
  }

  @override
  $CategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value));
    });
  }
}

/// @nodoc
abstract class _$SubCategoryCopyWith<$Res>
    implements $SubCategoryCopyWith<$Res> {
  factory _$SubCategoryCopyWith(
          _SubCategory value, $Res Function(_SubCategory) then) =
      __$SubCategoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String description,
      Sector? sectors,
      Platform? platform,
      Category? category});

  @override
  $SectorCopyWith<$Res>? get sectors;
  @override
  $PlatformCopyWith<$Res>? get platform;
  @override
  $CategoryCopyWith<$Res>? get category;
}

/// @nodoc
class __$SubCategoryCopyWithImpl<$Res> extends _$SubCategoryCopyWithImpl<$Res>
    implements _$SubCategoryCopyWith<$Res> {
  __$SubCategoryCopyWithImpl(
      _SubCategory _value, $Res Function(_SubCategory) _then)
      : super(_value, (v) => _then(v as _SubCategory));

  @override
  _SubCategory get _value => super._value as _SubCategory;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? sectors = freezed,
    Object? platform = freezed,
    Object? category = freezed,
  }) {
    return _then(_SubCategory(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      sectors: sectors == freezed
          ? _value.sectors
          : sectors // ignore: cast_nullable_to_non_nullable
              as Sector?,
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as Platform?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SubCategory implements _SubCategory {
  _$_SubCategory(
      {required this.id,
      this.name = '',
      this.description = '',
      this.sectors,
      this.platform,
      this.category});

  factory _$_SubCategory.fromJson(Map<String, dynamic> json) =>
      _$$_SubCategoryFromJson(json);

  @override
  final int id;
  @JsonKey()
  @override
  final String name;
  @JsonKey()
  @override
  final String description;
  @override
  final Sector? sectors;
  @override
  final Platform? platform;
  @override
  final Category? category;

  @override
  String toString() {
    return 'SubCategory(id: $id, name: $name, description: $description, sectors: $sectors, platform: $platform, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubCategory &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.sectors, sectors) &&
            const DeepCollectionEquality().equals(other.platform, platform) &&
            const DeepCollectionEquality().equals(other.category, category));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(sectors),
      const DeepCollectionEquality().hash(platform),
      const DeepCollectionEquality().hash(category));

  @JsonKey(ignore: true)
  @override
  _$SubCategoryCopyWith<_SubCategory> get copyWith =>
      __$SubCategoryCopyWithImpl<_SubCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubCategoryToJson(this);
  }
}

abstract class _SubCategory implements SubCategory {
  factory _SubCategory(
      {required int id,
      String name,
      String description,
      Sector? sectors,
      Platform? platform,
      Category? category}) = _$_SubCategory;

  factory _SubCategory.fromJson(Map<String, dynamic> json) =
      _$_SubCategory.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  Sector? get sectors;
  @override
  Platform? get platform;
  @override
  Category? get category;
  @override
  @JsonKey(ignore: true)
  _$SubCategoryCopyWith<_SubCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

Platform _$PlatformFromJson(Map<String, dynamic> json) {
  return _Platform.fromJson(json);
}

/// @nodoc
class _$PlatformTearOff {
  const _$PlatformTearOff();

  _Platform call(
      {required int id,
      String name = '',
      String description = '',
      Sector? sectors}) {
    return _Platform(
      id: id,
      name: name,
      description: description,
      sectors: sectors,
    );
  }

  Platform fromJson(Map<String, Object?> json) {
    return Platform.fromJson(json);
  }
}

/// @nodoc
const $Platform = _$PlatformTearOff();

/// @nodoc
mixin _$Platform {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Sector? get sectors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlatformCopyWith<Platform> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlatformCopyWith<$Res> {
  factory $PlatformCopyWith(Platform value, $Res Function(Platform) then) =
      _$PlatformCopyWithImpl<$Res>;
  $Res call({int id, String name, String description, Sector? sectors});

  $SectorCopyWith<$Res>? get sectors;
}

/// @nodoc
class _$PlatformCopyWithImpl<$Res> implements $PlatformCopyWith<$Res> {
  _$PlatformCopyWithImpl(this._value, this._then);

  final Platform _value;
  // ignore: unused_field
  final $Res Function(Platform) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? sectors = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      sectors: sectors == freezed
          ? _value.sectors
          : sectors // ignore: cast_nullable_to_non_nullable
              as Sector?,
    ));
  }

  @override
  $SectorCopyWith<$Res>? get sectors {
    if (_value.sectors == null) {
      return null;
    }

    return $SectorCopyWith<$Res>(_value.sectors!, (value) {
      return _then(_value.copyWith(sectors: value));
    });
  }
}

/// @nodoc
abstract class _$PlatformCopyWith<$Res> implements $PlatformCopyWith<$Res> {
  factory _$PlatformCopyWith(_Platform value, $Res Function(_Platform) then) =
      __$PlatformCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, String description, Sector? sectors});

  @override
  $SectorCopyWith<$Res>? get sectors;
}

/// @nodoc
class __$PlatformCopyWithImpl<$Res> extends _$PlatformCopyWithImpl<$Res>
    implements _$PlatformCopyWith<$Res> {
  __$PlatformCopyWithImpl(_Platform _value, $Res Function(_Platform) _then)
      : super(_value, (v) => _then(v as _Platform));

  @override
  _Platform get _value => super._value as _Platform;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? sectors = freezed,
  }) {
    return _then(_Platform(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      sectors: sectors == freezed
          ? _value.sectors
          : sectors // ignore: cast_nullable_to_non_nullable
              as Sector?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Platform implements _Platform {
  _$_Platform(
      {required this.id, this.name = '', this.description = '', this.sectors});

  factory _$_Platform.fromJson(Map<String, dynamic> json) =>
      _$$_PlatformFromJson(json);

  @override
  final int id;
  @JsonKey()
  @override
  final String name;
  @JsonKey()
  @override
  final String description;
  @override
  final Sector? sectors;

  @override
  String toString() {
    return 'Platform(id: $id, name: $name, description: $description, sectors: $sectors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Platform &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.sectors, sectors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(sectors));

  @JsonKey(ignore: true)
  @override
  _$PlatformCopyWith<_Platform> get copyWith =>
      __$PlatformCopyWithImpl<_Platform>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlatformToJson(this);
  }
}

abstract class _Platform implements Platform {
  factory _Platform(
      {required int id,
      String name,
      String description,
      Sector? sectors}) = _$_Platform;

  factory _Platform.fromJson(Map<String, dynamic> json) = _$_Platform.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  Sector? get sectors;
  @override
  @JsonKey(ignore: true)
  _$PlatformCopyWith<_Platform> get copyWith =>
      throw _privateConstructorUsedError;
}

PostForm _$PostFormFromJson(Map<String, dynamic> json) {
  return _PostForm.fromJson(json);
}

/// @nodoc
class _$PostFormTearOff {
  const _$PostFormTearOff();

  _PostForm call(
      {required Map<String, dynamic> user,
      bool published = false,
      required Map<String, dynamic> platform,
      required Map<String, dynamic> category,
      required Map<String, dynamic> subCategory,
      required Map<String, dynamic> country,
      required Map<String, dynamic> sectors,
      required String title,
      required String description,
      String? expire}) {
    return _PostForm(
      user: user,
      published: published,
      platform: platform,
      category: category,
      subCategory: subCategory,
      country: country,
      sectors: sectors,
      title: title,
      description: description,
      expire: expire,
    );
  }

  PostForm fromJson(Map<String, Object?> json) {
    return PostForm.fromJson(json);
  }
}

/// @nodoc
const $PostForm = _$PostFormTearOff();

/// @nodoc
mixin _$PostForm {
  Map<String, dynamic> get user => throw _privateConstructorUsedError;
  bool get published => throw _privateConstructorUsedError;
  Map<String, dynamic> get platform => throw _privateConstructorUsedError;
  Map<String, dynamic> get category => throw _privateConstructorUsedError;
  Map<String, dynamic> get subCategory => throw _privateConstructorUsedError;
  Map<String, dynamic> get country => throw _privateConstructorUsedError;
  Map<String, dynamic> get sectors => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get expire => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostFormCopyWith<PostForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostFormCopyWith<$Res> {
  factory $PostFormCopyWith(PostForm value, $Res Function(PostForm) then) =
      _$PostFormCopyWithImpl<$Res>;
  $Res call(
      {Map<String, dynamic> user,
      bool published,
      Map<String, dynamic> platform,
      Map<String, dynamic> category,
      Map<String, dynamic> subCategory,
      Map<String, dynamic> country,
      Map<String, dynamic> sectors,
      String title,
      String description,
      String? expire});
}

/// @nodoc
class _$PostFormCopyWithImpl<$Res> implements $PostFormCopyWith<$Res> {
  _$PostFormCopyWithImpl(this._value, this._then);

  final PostForm _value;
  // ignore: unused_field
  final $Res Function(PostForm) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? published = freezed,
    Object? platform = freezed,
    Object? category = freezed,
    Object? subCategory = freezed,
    Object? country = freezed,
    Object? sectors = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? expire = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      published: published == freezed
          ? _value.published
          : published // ignore: cast_nullable_to_non_nullable
              as bool,
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      subCategory: subCategory == freezed
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      sectors: sectors == freezed
          ? _value.sectors
          : sectors // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      expire: expire == freezed
          ? _value.expire
          : expire // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PostFormCopyWith<$Res> implements $PostFormCopyWith<$Res> {
  factory _$PostFormCopyWith(_PostForm value, $Res Function(_PostForm) then) =
      __$PostFormCopyWithImpl<$Res>;
  @override
  $Res call(
      {Map<String, dynamic> user,
      bool published,
      Map<String, dynamic> platform,
      Map<String, dynamic> category,
      Map<String, dynamic> subCategory,
      Map<String, dynamic> country,
      Map<String, dynamic> sectors,
      String title,
      String description,
      String? expire});
}

/// @nodoc
class __$PostFormCopyWithImpl<$Res> extends _$PostFormCopyWithImpl<$Res>
    implements _$PostFormCopyWith<$Res> {
  __$PostFormCopyWithImpl(_PostForm _value, $Res Function(_PostForm) _then)
      : super(_value, (v) => _then(v as _PostForm));

  @override
  _PostForm get _value => super._value as _PostForm;

  @override
  $Res call({
    Object? user = freezed,
    Object? published = freezed,
    Object? platform = freezed,
    Object? category = freezed,
    Object? subCategory = freezed,
    Object? country = freezed,
    Object? sectors = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? expire = freezed,
  }) {
    return _then(_PostForm(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      published: published == freezed
          ? _value.published
          : published // ignore: cast_nullable_to_non_nullable
              as bool,
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      subCategory: subCategory == freezed
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      sectors: sectors == freezed
          ? _value.sectors
          : sectors // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      expire: expire == freezed
          ? _value.expire
          : expire // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostForm extends _PostForm {
  _$_PostForm(
      {required this.user,
      this.published = false,
      required this.platform,
      required this.category,
      required this.subCategory,
      required this.country,
      required this.sectors,
      required this.title,
      required this.description,
      this.expire})
      : super._();

  factory _$_PostForm.fromJson(Map<String, dynamic> json) =>
      _$$_PostFormFromJson(json);

  @override
  final Map<String, dynamic> user;
  @JsonKey()
  @override
  final bool published;
  @override
  final Map<String, dynamic> platform;
  @override
  final Map<String, dynamic> category;
  @override
  final Map<String, dynamic> subCategory;
  @override
  final Map<String, dynamic> country;
  @override
  final Map<String, dynamic> sectors;
  @override
  final String title;
  @override
  final String description;
  @override
  final String? expire;

  @override
  String toString() {
    return 'PostForm(user: $user, published: $published, platform: $platform, category: $category, subCategory: $subCategory, country: $country, sectors: $sectors, title: $title, description: $description, expire: $expire)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostForm &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.published, published) &&
            const DeepCollectionEquality().equals(other.platform, platform) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality()
                .equals(other.subCategory, subCategory) &&
            const DeepCollectionEquality().equals(other.country, country) &&
            const DeepCollectionEquality().equals(other.sectors, sectors) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.expire, expire));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(published),
      const DeepCollectionEquality().hash(platform),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(subCategory),
      const DeepCollectionEquality().hash(country),
      const DeepCollectionEquality().hash(sectors),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(expire));

  @JsonKey(ignore: true)
  @override
  _$PostFormCopyWith<_PostForm> get copyWith =>
      __$PostFormCopyWithImpl<_PostForm>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostFormToJson(this);
  }
}

abstract class _PostForm extends PostForm {
  factory _PostForm(
      {required Map<String, dynamic> user,
      bool published,
      required Map<String, dynamic> platform,
      required Map<String, dynamic> category,
      required Map<String, dynamic> subCategory,
      required Map<String, dynamic> country,
      required Map<String, dynamic> sectors,
      required String title,
      required String description,
      String? expire}) = _$_PostForm;
  _PostForm._() : super._();

  factory _PostForm.fromJson(Map<String, dynamic> json) = _$_PostForm.fromJson;

  @override
  Map<String, dynamic> get user;
  @override
  bool get published;
  @override
  Map<String, dynamic> get platform;
  @override
  Map<String, dynamic> get category;
  @override
  Map<String, dynamic> get subCategory;
  @override
  Map<String, dynamic> get country;
  @override
  Map<String, dynamic> get sectors;
  @override
  String get title;
  @override
  String get description;
  @override
  String? get expire;
  @override
  @JsonKey(ignore: true)
  _$PostFormCopyWith<_PostForm> get copyWith =>
      throw _privateConstructorUsedError;
}
