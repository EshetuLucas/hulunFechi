// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {required int id,
      required String username,
      String? fullname,
      required String firstname,
      required String lastname,
      required String email,
      String? country,
      String? phone,
      String? profession,
      String? dob,
      String? region,
      String? city,
      String? woreda,
      String? subcity,
      String? housenumber,
      String? state,
      String? street,
      String? ssn,
      String? account,
      String? bank,
      String? accessToken,
      String? tokenType,
      String? tin,
      String? profilePicPath,
      List<Country?> usercountry = const [],
      List<User?> following = const [],
      List<Category?> usercategories = const []}) {
    return _User(
      id: id,
      username: username,
      fullname: fullname,
      firstname: firstname,
      lastname: lastname,
      email: email,
      country: country,
      phone: phone,
      profession: profession,
      dob: dob,
      region: region,
      city: city,
      woreda: woreda,
      subcity: subcity,
      housenumber: housenumber,
      state: state,
      street: street,
      ssn: ssn,
      account: account,
      bank: bank,
      accessToken: accessToken,
      tokenType: tokenType,
      tin: tin,
      profilePicPath: profilePicPath,
      usercountry: usercountry,
      following: following,
      usercategories: usercategories,
    );
  }

  User fromJson(Map<String, Object?> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  int get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get fullname => throw _privateConstructorUsedError;
  String get firstname => throw _privateConstructorUsedError;
  String get lastname => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get profession => throw _privateConstructorUsedError;
  String? get dob => throw _privateConstructorUsedError;
  String? get region => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get woreda => throw _privateConstructorUsedError;
  String? get subcity => throw _privateConstructorUsedError;
  String? get housenumber => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get street => throw _privateConstructorUsedError;
  String? get ssn => throw _privateConstructorUsedError;
  String? get account => throw _privateConstructorUsedError;
  String? get bank => throw _privateConstructorUsedError;
  String? get accessToken => throw _privateConstructorUsedError;
  String? get tokenType => throw _privateConstructorUsedError;
  String? get tin => throw _privateConstructorUsedError;
  String? get profilePicPath => throw _privateConstructorUsedError;
  List<Country?> get usercountry => throw _privateConstructorUsedError;
  List<User?> get following => throw _privateConstructorUsedError;
  List<Category?> get usercategories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String username,
      String? fullname,
      String firstname,
      String lastname,
      String email,
      String? country,
      String? phone,
      String? profession,
      String? dob,
      String? region,
      String? city,
      String? woreda,
      String? subcity,
      String? housenumber,
      String? state,
      String? street,
      String? ssn,
      String? account,
      String? bank,
      String? accessToken,
      String? tokenType,
      String? tin,
      String? profilePicPath,
      List<Country?> usercountry,
      List<User?> following,
      List<Category?> usercategories});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? fullname = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? email = freezed,
    Object? country = freezed,
    Object? phone = freezed,
    Object? profession = freezed,
    Object? dob = freezed,
    Object? region = freezed,
    Object? city = freezed,
    Object? woreda = freezed,
    Object? subcity = freezed,
    Object? housenumber = freezed,
    Object? state = freezed,
    Object? street = freezed,
    Object? ssn = freezed,
    Object? account = freezed,
    Object? bank = freezed,
    Object? accessToken = freezed,
    Object? tokenType = freezed,
    Object? tin = freezed,
    Object? profilePicPath = freezed,
    Object? usercountry = freezed,
    Object? following = freezed,
    Object? usercategories = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      fullname: fullname == freezed
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String?,
      firstname: firstname == freezed
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: lastname == freezed
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      profession: profession == freezed
          ? _value.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: dob == freezed
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      region: region == freezed
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      woreda: woreda == freezed
          ? _value.woreda
          : woreda // ignore: cast_nullable_to_non_nullable
              as String?,
      subcity: subcity == freezed
          ? _value.subcity
          : subcity // ignore: cast_nullable_to_non_nullable
              as String?,
      housenumber: housenumber == freezed
          ? _value.housenumber
          : housenumber // ignore: cast_nullable_to_non_nullable
              as String?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      street: street == freezed
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      ssn: ssn == freezed
          ? _value.ssn
          : ssn // ignore: cast_nullable_to_non_nullable
              as String?,
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
      bank: bank == freezed
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: tokenType == freezed
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
      tin: tin == freezed
          ? _value.tin
          : tin // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicPath: profilePicPath == freezed
          ? _value.profilePicPath
          : profilePicPath // ignore: cast_nullable_to_non_nullable
              as String?,
      usercountry: usercountry == freezed
          ? _value.usercountry
          : usercountry // ignore: cast_nullable_to_non_nullable
              as List<Country?>,
      following: following == freezed
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as List<User?>,
      usercategories: usercategories == freezed
          ? _value.usercategories
          : usercategories // ignore: cast_nullable_to_non_nullable
              as List<Category?>,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String username,
      String? fullname,
      String firstname,
      String lastname,
      String email,
      String? country,
      String? phone,
      String? profession,
      String? dob,
      String? region,
      String? city,
      String? woreda,
      String? subcity,
      String? housenumber,
      String? state,
      String? street,
      String? ssn,
      String? account,
      String? bank,
      String? accessToken,
      String? tokenType,
      String? tin,
      String? profilePicPath,
      List<Country?> usercountry,
      List<User?> following,
      List<Category?> usercategories});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? fullname = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? email = freezed,
    Object? country = freezed,
    Object? phone = freezed,
    Object? profession = freezed,
    Object? dob = freezed,
    Object? region = freezed,
    Object? city = freezed,
    Object? woreda = freezed,
    Object? subcity = freezed,
    Object? housenumber = freezed,
    Object? state = freezed,
    Object? street = freezed,
    Object? ssn = freezed,
    Object? account = freezed,
    Object? bank = freezed,
    Object? accessToken = freezed,
    Object? tokenType = freezed,
    Object? tin = freezed,
    Object? profilePicPath = freezed,
    Object? usercountry = freezed,
    Object? following = freezed,
    Object? usercategories = freezed,
  }) {
    return _then(_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      fullname: fullname == freezed
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String?,
      firstname: firstname == freezed
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: lastname == freezed
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      profession: profession == freezed
          ? _value.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: dob == freezed
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      region: region == freezed
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      woreda: woreda == freezed
          ? _value.woreda
          : woreda // ignore: cast_nullable_to_non_nullable
              as String?,
      subcity: subcity == freezed
          ? _value.subcity
          : subcity // ignore: cast_nullable_to_non_nullable
              as String?,
      housenumber: housenumber == freezed
          ? _value.housenumber
          : housenumber // ignore: cast_nullable_to_non_nullable
              as String?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      street: street == freezed
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      ssn: ssn == freezed
          ? _value.ssn
          : ssn // ignore: cast_nullable_to_non_nullable
              as String?,
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
      bank: bank == freezed
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: tokenType == freezed
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
      tin: tin == freezed
          ? _value.tin
          : tin // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicPath: profilePicPath == freezed
          ? _value.profilePicPath
          : profilePicPath // ignore: cast_nullable_to_non_nullable
              as String?,
      usercountry: usercountry == freezed
          ? _value.usercountry
          : usercountry // ignore: cast_nullable_to_non_nullable
              as List<Country?>,
      following: following == freezed
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as List<User?>,
      usercategories: usercategories == freezed
          ? _value.usercategories
          : usercategories // ignore: cast_nullable_to_non_nullable
              as List<Category?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User extends _User {
  _$_User(
      {required this.id,
      required this.username,
      this.fullname,
      required this.firstname,
      required this.lastname,
      required this.email,
      this.country,
      this.phone,
      this.profession,
      this.dob,
      this.region,
      this.city,
      this.woreda,
      this.subcity,
      this.housenumber,
      this.state,
      this.street,
      this.ssn,
      this.account,
      this.bank,
      this.accessToken,
      this.tokenType,
      this.tin,
      this.profilePicPath,
      this.usercountry = const [],
      this.following = const [],
      this.usercategories = const []})
      : super._();

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final int id;
  @override
  final String username;
  @override
  final String? fullname;
  @override
  final String firstname;
  @override
  final String lastname;
  @override
  final String email;
  @override
  final String? country;
  @override
  final String? phone;
  @override
  final String? profession;
  @override
  final String? dob;
  @override
  final String? region;
  @override
  final String? city;
  @override
  final String? woreda;
  @override
  final String? subcity;
  @override
  final String? housenumber;
  @override
  final String? state;
  @override
  final String? street;
  @override
  final String? ssn;
  @override
  final String? account;
  @override
  final String? bank;
  @override
  final String? accessToken;
  @override
  final String? tokenType;
  @override
  final String? tin;
  @override
  final String? profilePicPath;
  @JsonKey()
  @override
  final List<Country?> usercountry;
  @JsonKey()
  @override
  final List<User?> following;
  @JsonKey()
  @override
  final List<Category?> usercategories;

  @override
  String toString() {
    return 'User(id: $id, username: $username, fullname: $fullname, firstname: $firstname, lastname: $lastname, email: $email, country: $country, phone: $phone, profession: $profession, dob: $dob, region: $region, city: $city, woreda: $woreda, subcity: $subcity, housenumber: $housenumber, state: $state, street: $street, ssn: $ssn, account: $account, bank: $bank, accessToken: $accessToken, tokenType: $tokenType, tin: $tin, profilePicPath: $profilePicPath, usercountry: $usercountry, following: $following, usercategories: $usercategories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.fullname, fullname) &&
            const DeepCollectionEquality().equals(other.firstname, firstname) &&
            const DeepCollectionEquality().equals(other.lastname, lastname) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.country, country) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality()
                .equals(other.profession, profession) &&
            const DeepCollectionEquality().equals(other.dob, dob) &&
            const DeepCollectionEquality().equals(other.region, region) &&
            const DeepCollectionEquality().equals(other.city, city) &&
            const DeepCollectionEquality().equals(other.woreda, woreda) &&
            const DeepCollectionEquality().equals(other.subcity, subcity) &&
            const DeepCollectionEquality()
                .equals(other.housenumber, housenumber) &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.street, street) &&
            const DeepCollectionEquality().equals(other.ssn, ssn) &&
            const DeepCollectionEquality().equals(other.account, account) &&
            const DeepCollectionEquality().equals(other.bank, bank) &&
            const DeepCollectionEquality()
                .equals(other.accessToken, accessToken) &&
            const DeepCollectionEquality().equals(other.tokenType, tokenType) &&
            const DeepCollectionEquality().equals(other.tin, tin) &&
            const DeepCollectionEquality()
                .equals(other.profilePicPath, profilePicPath) &&
            const DeepCollectionEquality()
                .equals(other.usercountry, usercountry) &&
            const DeepCollectionEquality().equals(other.following, following) &&
            const DeepCollectionEquality()
                .equals(other.usercategories, usercategories));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(id),
        const DeepCollectionEquality().hash(username),
        const DeepCollectionEquality().hash(fullname),
        const DeepCollectionEquality().hash(firstname),
        const DeepCollectionEquality().hash(lastname),
        const DeepCollectionEquality().hash(email),
        const DeepCollectionEquality().hash(country),
        const DeepCollectionEquality().hash(phone),
        const DeepCollectionEquality().hash(profession),
        const DeepCollectionEquality().hash(dob),
        const DeepCollectionEquality().hash(region),
        const DeepCollectionEquality().hash(city),
        const DeepCollectionEquality().hash(woreda),
        const DeepCollectionEquality().hash(subcity),
        const DeepCollectionEquality().hash(housenumber),
        const DeepCollectionEquality().hash(state),
        const DeepCollectionEquality().hash(street),
        const DeepCollectionEquality().hash(ssn),
        const DeepCollectionEquality().hash(account),
        const DeepCollectionEquality().hash(bank),
        const DeepCollectionEquality().hash(accessToken),
        const DeepCollectionEquality().hash(tokenType),
        const DeepCollectionEquality().hash(tin),
        const DeepCollectionEquality().hash(profilePicPath),
        const DeepCollectionEquality().hash(usercountry),
        const DeepCollectionEquality().hash(following),
        const DeepCollectionEquality().hash(usercategories)
      ]);

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(this);
  }
}

abstract class _User extends User {
  factory _User(
      {required int id,
      required String username,
      String? fullname,
      required String firstname,
      required String lastname,
      required String email,
      String? country,
      String? phone,
      String? profession,
      String? dob,
      String? region,
      String? city,
      String? woreda,
      String? subcity,
      String? housenumber,
      String? state,
      String? street,
      String? ssn,
      String? account,
      String? bank,
      String? accessToken,
      String? tokenType,
      String? tin,
      String? profilePicPath,
      List<Country?> usercountry,
      List<User?> following,
      List<Category?> usercategories}) = _$_User;
  _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  int get id;
  @override
  String get username;
  @override
  String? get fullname;
  @override
  String get firstname;
  @override
  String get lastname;
  @override
  String get email;
  @override
  String? get country;
  @override
  String? get phone;
  @override
  String? get profession;
  @override
  String? get dob;
  @override
  String? get region;
  @override
  String? get city;
  @override
  String? get woreda;
  @override
  String? get subcity;
  @override
  String? get housenumber;
  @override
  String? get state;
  @override
  String? get street;
  @override
  String? get ssn;
  @override
  String? get account;
  @override
  String? get bank;
  @override
  String? get accessToken;
  @override
  String? get tokenType;
  @override
  String? get tin;
  @override
  String? get profilePicPath;
  @override
  List<Country?> get usercountry;
  @override
  List<User?> get following;
  @override
  List<Category?> get usercategories;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}

UserForm _$UserFormFromJson(Map<String, dynamic> json) {
  return _UserForm.fromJson(json);
}

/// @nodoc
class _$UserFormTearOff {
  const _$UserFormTearOff();

  _UserForm call(
      {required int id,
      required String username,
      required String email,
      required String password,
      required String accessToken,
      required String tokenType,
      List<String>? roles}) {
    return _UserForm(
      id: id,
      username: username,
      email: email,
      password: password,
      accessToken: accessToken,
      tokenType: tokenType,
      roles: roles,
    );
  }

  UserForm fromJson(Map<String, Object?> json) {
    return UserForm.fromJson(json);
  }
}

/// @nodoc
const $UserForm = _$UserFormTearOff();

/// @nodoc
mixin _$UserForm {
  int get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get accessToken => throw _privateConstructorUsedError;
  String get tokenType => throw _privateConstructorUsedError;
  List<String>? get roles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserFormCopyWith<UserForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFormCopyWith<$Res> {
  factory $UserFormCopyWith(UserForm value, $Res Function(UserForm) then) =
      _$UserFormCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String username,
      String email,
      String password,
      String accessToken,
      String tokenType,
      List<String>? roles});
}

/// @nodoc
class _$UserFormCopyWithImpl<$Res> implements $UserFormCopyWith<$Res> {
  _$UserFormCopyWithImpl(this._value, this._then);

  final UserForm _value;
  // ignore: unused_field
  final $Res Function(UserForm) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? accessToken = freezed,
    Object? tokenType = freezed,
    Object? roles = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: tokenType == freezed
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      roles: roles == freezed
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
abstract class _$UserFormCopyWith<$Res> implements $UserFormCopyWith<$Res> {
  factory _$UserFormCopyWith(_UserForm value, $Res Function(_UserForm) then) =
      __$UserFormCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String username,
      String email,
      String password,
      String accessToken,
      String tokenType,
      List<String>? roles});
}

/// @nodoc
class __$UserFormCopyWithImpl<$Res> extends _$UserFormCopyWithImpl<$Res>
    implements _$UserFormCopyWith<$Res> {
  __$UserFormCopyWithImpl(_UserForm _value, $Res Function(_UserForm) _then)
      : super(_value, (v) => _then(v as _UserForm));

  @override
  _UserForm get _value => super._value as _UserForm;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? accessToken = freezed,
    Object? tokenType = freezed,
    Object? roles = freezed,
  }) {
    return _then(_UserForm(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: tokenType == freezed
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      roles: roles == freezed
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserForm extends _UserForm {
  _$_UserForm(
      {required this.id,
      required this.username,
      required this.email,
      required this.password,
      required this.accessToken,
      required this.tokenType,
      this.roles})
      : super._();

  factory _$_UserForm.fromJson(Map<String, dynamic> json) =>
      _$$_UserFormFromJson(json);

  @override
  final int id;
  @override
  final String username;
  @override
  final String email;
  @override
  final String password;
  @override
  final String accessToken;
  @override
  final String tokenType;
  @override
  final List<String>? roles;

  @override
  String toString() {
    return 'UserForm(id: $id, username: $username, email: $email, password: $password, accessToken: $accessToken, tokenType: $tokenType, roles: $roles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserForm &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.accessToken, accessToken) &&
            const DeepCollectionEquality().equals(other.tokenType, tokenType) &&
            const DeepCollectionEquality().equals(other.roles, roles));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(accessToken),
      const DeepCollectionEquality().hash(tokenType),
      const DeepCollectionEquality().hash(roles));

  @JsonKey(ignore: true)
  @override
  _$UserFormCopyWith<_UserForm> get copyWith =>
      __$UserFormCopyWithImpl<_UserForm>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserFormToJson(this);
  }
}

abstract class _UserForm extends UserForm {
  factory _UserForm(
      {required int id,
      required String username,
      required String email,
      required String password,
      required String accessToken,
      required String tokenType,
      List<String>? roles}) = _$_UserForm;
  _UserForm._() : super._();

  factory _UserForm.fromJson(Map<String, dynamic> json) = _$_UserForm.fromJson;

  @override
  int get id;
  @override
  String get username;
  @override
  String get email;
  @override
  String get password;
  @override
  String get accessToken;
  @override
  String get tokenType;
  @override
  List<String>? get roles;
  @override
  @JsonKey(ignore: true)
  _$UserFormCopyWith<_UserForm> get copyWith =>
      throw _privateConstructorUsedError;
}
