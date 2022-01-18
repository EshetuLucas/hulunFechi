// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
class _$LocationTearOff {
  const _$LocationTearOff();

  _Location call({double? latitude, double? longitude, String? placeId}) {
    return _Location(
      latitude: latitude,
      longitude: longitude,
      placeId: placeId,
    );
  }

  Location fromJson(Map<String, Object?> json) {
    return Location.fromJson(json);
  }
}

/// @nodoc
const $Location = _$LocationTearOff();

/// @nodoc
mixin _$Location {
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  String? get placeId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res>;
  $Res call({double? latitude, double? longitude, String? placeId});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res> implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  final Location _value;
  // ignore: unused_field
  final $Res Function(Location) _then;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? placeId = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      placeId: placeId == freezed
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$LocationCopyWith<$Res> implements $LocationCopyWith<$Res> {
  factory _$LocationCopyWith(_Location value, $Res Function(_Location) then) =
      __$LocationCopyWithImpl<$Res>;
  @override
  $Res call({double? latitude, double? longitude, String? placeId});
}

/// @nodoc
class __$LocationCopyWithImpl<$Res> extends _$LocationCopyWithImpl<$Res>
    implements _$LocationCopyWith<$Res> {
  __$LocationCopyWithImpl(_Location _value, $Res Function(_Location) _then)
      : super(_value, (v) => _then(v as _Location));

  @override
  _Location get _value => super._value as _Location;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? placeId = freezed,
  }) {
    return _then(_Location(
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      placeId: placeId == freezed
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Location extends _Location {
  _$_Location({this.latitude, this.longitude, this.placeId}) : super._();

  factory _$_Location.fromJson(Map<String, dynamic> json) =>
      _$$_LocationFromJson(json);

  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final String? placeId;

  @override
  String toString() {
    return 'Location(latitude: $latitude, longitude: $longitude, placeId: $placeId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Location &&
            const DeepCollectionEquality().equals(other.latitude, latitude) &&
            const DeepCollectionEquality().equals(other.longitude, longitude) &&
            const DeepCollectionEquality().equals(other.placeId, placeId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(latitude),
      const DeepCollectionEquality().hash(longitude),
      const DeepCollectionEquality().hash(placeId));

  @JsonKey(ignore: true)
  @override
  _$LocationCopyWith<_Location> get copyWith =>
      __$LocationCopyWithImpl<_Location>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocationToJson(this);
  }
}

abstract class _Location extends Location {
  factory _Location({double? latitude, double? longitude, String? placeId}) =
      _$_Location;
  _Location._() : super._();

  factory _Location.fromJson(Map<String, dynamic> json) = _$_Location.fromJson;

  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  String? get placeId;
  @override
  @JsonKey(ignore: true)
  _$LocationCopyWith<_Location> get copyWith =>
      throw _privateConstructorUsedError;
}

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
class _$EventTearOff {
  const _$EventTearOff();

  _Event call(
      {required int id,
      required String eventName,
      required String eventDescription,
      required String beginDate,
      required String endDate,
      required String ticketingBeginDate,
      required String ticketingEndDate,
      required String eventCategory,
      required String eventCategoryId,
      required String eventType,
      required String organizerName,
      String? tinNumber}) {
    return _Event(
      id: id,
      eventName: eventName,
      eventDescription: eventDescription,
      beginDate: beginDate,
      endDate: endDate,
      ticketingBeginDate: ticketingBeginDate,
      ticketingEndDate: ticketingEndDate,
      eventCategory: eventCategory,
      eventCategoryId: eventCategoryId,
      eventType: eventType,
      organizerName: organizerName,
      tinNumber: tinNumber,
    );
  }

  Event fromJson(Map<String, Object?> json) {
    return Event.fromJson(json);
  }
}

/// @nodoc
const $Event = _$EventTearOff();

/// @nodoc
mixin _$Event {
  int get id => throw _privateConstructorUsedError;
  String get eventName => throw _privateConstructorUsedError;
  String get eventDescription => throw _privateConstructorUsedError;
  String get beginDate => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;
  String get ticketingBeginDate => throw _privateConstructorUsedError;
  String get ticketingEndDate => throw _privateConstructorUsedError;
  String get eventCategory => throw _privateConstructorUsedError;
  String get eventCategoryId => throw _privateConstructorUsedError;
  String get eventType => throw _privateConstructorUsedError;
  String get organizerName => throw _privateConstructorUsedError;
  String? get tinNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String eventName,
      String eventDescription,
      String beginDate,
      String endDate,
      String ticketingBeginDate,
      String ticketingEndDate,
      String eventCategory,
      String eventCategoryId,
      String eventType,
      String organizerName,
      String? tinNumber});
}

/// @nodoc
class _$EventCopyWithImpl<$Res> implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  final Event _value;
  // ignore: unused_field
  final $Res Function(Event) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? eventName = freezed,
    Object? eventDescription = freezed,
    Object? beginDate = freezed,
    Object? endDate = freezed,
    Object? ticketingBeginDate = freezed,
    Object? ticketingEndDate = freezed,
    Object? eventCategory = freezed,
    Object? eventCategoryId = freezed,
    Object? eventType = freezed,
    Object? organizerName = freezed,
    Object? tinNumber = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      eventName: eventName == freezed
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String,
      eventDescription: eventDescription == freezed
          ? _value.eventDescription
          : eventDescription // ignore: cast_nullable_to_non_nullable
              as String,
      beginDate: beginDate == freezed
          ? _value.beginDate
          : beginDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      ticketingBeginDate: ticketingBeginDate == freezed
          ? _value.ticketingBeginDate
          : ticketingBeginDate // ignore: cast_nullable_to_non_nullable
              as String,
      ticketingEndDate: ticketingEndDate == freezed
          ? _value.ticketingEndDate
          : ticketingEndDate // ignore: cast_nullable_to_non_nullable
              as String,
      eventCategory: eventCategory == freezed
          ? _value.eventCategory
          : eventCategory // ignore: cast_nullable_to_non_nullable
              as String,
      eventCategoryId: eventCategoryId == freezed
          ? _value.eventCategoryId
          : eventCategoryId // ignore: cast_nullable_to_non_nullable
              as String,
      eventType: eventType == freezed
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      organizerName: organizerName == freezed
          ? _value.organizerName
          : organizerName // ignore: cast_nullable_to_non_nullable
              as String,
      tinNumber: tinNumber == freezed
          ? _value.tinNumber
          : tinNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$EventCopyWith(_Event value, $Res Function(_Event) then) =
      __$EventCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String eventName,
      String eventDescription,
      String beginDate,
      String endDate,
      String ticketingBeginDate,
      String ticketingEndDate,
      String eventCategory,
      String eventCategoryId,
      String eventType,
      String organizerName,
      String? tinNumber});
}

/// @nodoc
class __$EventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res>
    implements _$EventCopyWith<$Res> {
  __$EventCopyWithImpl(_Event _value, $Res Function(_Event) _then)
      : super(_value, (v) => _then(v as _Event));

  @override
  _Event get _value => super._value as _Event;

  @override
  $Res call({
    Object? id = freezed,
    Object? eventName = freezed,
    Object? eventDescription = freezed,
    Object? beginDate = freezed,
    Object? endDate = freezed,
    Object? ticketingBeginDate = freezed,
    Object? ticketingEndDate = freezed,
    Object? eventCategory = freezed,
    Object? eventCategoryId = freezed,
    Object? eventType = freezed,
    Object? organizerName = freezed,
    Object? tinNumber = freezed,
  }) {
    return _then(_Event(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      eventName: eventName == freezed
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String,
      eventDescription: eventDescription == freezed
          ? _value.eventDescription
          : eventDescription // ignore: cast_nullable_to_non_nullable
              as String,
      beginDate: beginDate == freezed
          ? _value.beginDate
          : beginDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      ticketingBeginDate: ticketingBeginDate == freezed
          ? _value.ticketingBeginDate
          : ticketingBeginDate // ignore: cast_nullable_to_non_nullable
              as String,
      ticketingEndDate: ticketingEndDate == freezed
          ? _value.ticketingEndDate
          : ticketingEndDate // ignore: cast_nullable_to_non_nullable
              as String,
      eventCategory: eventCategory == freezed
          ? _value.eventCategory
          : eventCategory // ignore: cast_nullable_to_non_nullable
              as String,
      eventCategoryId: eventCategoryId == freezed
          ? _value.eventCategoryId
          : eventCategoryId // ignore: cast_nullable_to_non_nullable
              as String,
      eventType: eventType == freezed
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      organizerName: organizerName == freezed
          ? _value.organizerName
          : organizerName // ignore: cast_nullable_to_non_nullable
              as String,
      tinNumber: tinNumber == freezed
          ? _value.tinNumber
          : tinNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Event extends _Event {
  _$_Event(
      {required this.id,
      required this.eventName,
      required this.eventDescription,
      required this.beginDate,
      required this.endDate,
      required this.ticketingBeginDate,
      required this.ticketingEndDate,
      required this.eventCategory,
      required this.eventCategoryId,
      required this.eventType,
      required this.organizerName,
      this.tinNumber})
      : super._();

  factory _$_Event.fromJson(Map<String, dynamic> json) =>
      _$$_EventFromJson(json);

  @override
  final int id;
  @override
  final String eventName;
  @override
  final String eventDescription;
  @override
  final String beginDate;
  @override
  final String endDate;
  @override
  final String ticketingBeginDate;
  @override
  final String ticketingEndDate;
  @override
  final String eventCategory;
  @override
  final String eventCategoryId;
  @override
  final String eventType;
  @override
  final String organizerName;
  @override
  final String? tinNumber;

  @override
  String toString() {
    return 'Event(id: $id, eventName: $eventName, eventDescription: $eventDescription, beginDate: $beginDate, endDate: $endDate, ticketingBeginDate: $ticketingBeginDate, ticketingEndDate: $ticketingEndDate, eventCategory: $eventCategory, eventCategoryId: $eventCategoryId, eventType: $eventType, organizerName: $organizerName, tinNumber: $tinNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Event &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.eventName, eventName) &&
            const DeepCollectionEquality()
                .equals(other.eventDescription, eventDescription) &&
            const DeepCollectionEquality().equals(other.beginDate, beginDate) &&
            const DeepCollectionEquality().equals(other.endDate, endDate) &&
            const DeepCollectionEquality()
                .equals(other.ticketingBeginDate, ticketingBeginDate) &&
            const DeepCollectionEquality()
                .equals(other.ticketingEndDate, ticketingEndDate) &&
            const DeepCollectionEquality()
                .equals(other.eventCategory, eventCategory) &&
            const DeepCollectionEquality()
                .equals(other.eventCategoryId, eventCategoryId) &&
            const DeepCollectionEquality().equals(other.eventType, eventType) &&
            const DeepCollectionEquality()
                .equals(other.organizerName, organizerName) &&
            const DeepCollectionEquality().equals(other.tinNumber, tinNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(eventName),
      const DeepCollectionEquality().hash(eventDescription),
      const DeepCollectionEquality().hash(beginDate),
      const DeepCollectionEquality().hash(endDate),
      const DeepCollectionEquality().hash(ticketingBeginDate),
      const DeepCollectionEquality().hash(ticketingEndDate),
      const DeepCollectionEquality().hash(eventCategory),
      const DeepCollectionEquality().hash(eventCategoryId),
      const DeepCollectionEquality().hash(eventType),
      const DeepCollectionEquality().hash(organizerName),
      const DeepCollectionEquality().hash(tinNumber));

  @JsonKey(ignore: true)
  @override
  _$EventCopyWith<_Event> get copyWith =>
      __$EventCopyWithImpl<_Event>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventToJson(this);
  }
}

abstract class _Event extends Event {
  factory _Event(
      {required int id,
      required String eventName,
      required String eventDescription,
      required String beginDate,
      required String endDate,
      required String ticketingBeginDate,
      required String ticketingEndDate,
      required String eventCategory,
      required String eventCategoryId,
      required String eventType,
      required String organizerName,
      String? tinNumber}) = _$_Event;
  _Event._() : super._();

  factory _Event.fromJson(Map<String, dynamic> json) = _$_Event.fromJson;

  @override
  int get id;
  @override
  String get eventName;
  @override
  String get eventDescription;
  @override
  String get beginDate;
  @override
  String get endDate;
  @override
  String get ticketingBeginDate;
  @override
  String get ticketingEndDate;
  @override
  String get eventCategory;
  @override
  String get eventCategoryId;
  @override
  String get eventType;
  @override
  String get organizerName;
  @override
  String? get tinNumber;
  @override
  @JsonKey(ignore: true)
  _$EventCopyWith<_Event> get copyWith => throw _privateConstructorUsedError;
}

UserAccount _$UserAccountFromJson(Map<String, dynamic> json) {
  return _UserAccount.fromJson(json);
}

/// @nodoc
class _$UserAccountTearOff {
  const _$UserAccountTearOff();

  _UserAccount call(
      {required int id,
      required String name,
      required String email,
      required String userType,
      required String status,
      String? mobile}) {
    return _UserAccount(
      id: id,
      name: name,
      email: email,
      userType: userType,
      status: status,
      mobile: mobile,
    );
  }

  UserAccount fromJson(Map<String, Object?> json) {
    return UserAccount.fromJson(json);
  }
}

/// @nodoc
const $UserAccount = _$UserAccountTearOff();

/// @nodoc
mixin _$UserAccount {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get userType => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get mobile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserAccountCopyWith<UserAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAccountCopyWith<$Res> {
  factory $UserAccountCopyWith(
          UserAccount value, $Res Function(UserAccount) then) =
      _$UserAccountCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String email,
      String userType,
      String status,
      String? mobile});
}

/// @nodoc
class _$UserAccountCopyWithImpl<$Res> implements $UserAccountCopyWith<$Res> {
  _$UserAccountCopyWithImpl(this._value, this._then);

  final UserAccount _value;
  // ignore: unused_field
  final $Res Function(UserAccount) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? userType = freezed,
    Object? status = freezed,
    Object? mobile = freezed,
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
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userType: userType == freezed
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      mobile: mobile == freezed
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$UserAccountCopyWith<$Res>
    implements $UserAccountCopyWith<$Res> {
  factory _$UserAccountCopyWith(
          _UserAccount value, $Res Function(_UserAccount) then) =
      __$UserAccountCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String email,
      String userType,
      String status,
      String? mobile});
}

/// @nodoc
class __$UserAccountCopyWithImpl<$Res> extends _$UserAccountCopyWithImpl<$Res>
    implements _$UserAccountCopyWith<$Res> {
  __$UserAccountCopyWithImpl(
      _UserAccount _value, $Res Function(_UserAccount) _then)
      : super(_value, (v) => _then(v as _UserAccount));

  @override
  _UserAccount get _value => super._value as _UserAccount;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? userType = freezed,
    Object? status = freezed,
    Object? mobile = freezed,
  }) {
    return _then(_UserAccount(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userType: userType == freezed
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      mobile: mobile == freezed
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserAccount extends _UserAccount {
  _$_UserAccount(
      {required this.id,
      required this.name,
      required this.email,
      required this.userType,
      required this.status,
      this.mobile})
      : super._();

  factory _$_UserAccount.fromJson(Map<String, dynamic> json) =>
      _$$_UserAccountFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String userType;
  @override
  final String status;
  @override
  final String? mobile;

  @override
  String toString() {
    return 'UserAccount(id: $id, name: $name, email: $email, userType: $userType, status: $status, mobile: $mobile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserAccount &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.userType, userType) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.mobile, mobile));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(userType),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(mobile));

  @JsonKey(ignore: true)
  @override
  _$UserAccountCopyWith<_UserAccount> get copyWith =>
      __$UserAccountCopyWithImpl<_UserAccount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserAccountToJson(this);
  }
}

abstract class _UserAccount extends UserAccount {
  factory _UserAccount(
      {required int id,
      required String name,
      required String email,
      required String userType,
      required String status,
      String? mobile}) = _$_UserAccount;
  _UserAccount._() : super._();

  factory _UserAccount.fromJson(Map<String, dynamic> json) =
      _$_UserAccount.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String get userType;
  @override
  String get status;
  @override
  String? get mobile;
  @override
  @JsonKey(ignore: true)
  _$UserAccountCopyWith<_UserAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

Country _$CountryFromJson(Map<String, dynamic> json) {
  return _Country.fromJson(json);
}

/// @nodoc
class _$CountryTearOff {
  const _$CountryTearOff();

  _Country call(
      {int id = 1,
      required String name,
      String description = '',
      String code = '',
      String dialCode = '',
      String flag = ''}) {
    return _Country(
      id: id,
      name: name,
      description: description,
      code: code,
      dialCode: dialCode,
      flag: flag,
    );
  }

  Country fromJson(Map<String, Object?> json) {
    return Country.fromJson(json);
  }
}

/// @nodoc
const $Country = _$CountryTearOff();

/// @nodoc
mixin _$Country {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get dialCode => throw _privateConstructorUsedError;
  String get flag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryCopyWith<Country> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryCopyWith<$Res> {
  factory $CountryCopyWith(Country value, $Res Function(Country) then) =
      _$CountryCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String description,
      String code,
      String dialCode,
      String flag});
}

/// @nodoc
class _$CountryCopyWithImpl<$Res> implements $CountryCopyWith<$Res> {
  _$CountryCopyWithImpl(this._value, this._then);

  final Country _value;
  // ignore: unused_field
  final $Res Function(Country) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? code = freezed,
    Object? dialCode = freezed,
    Object? flag = freezed,
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
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      dialCode: dialCode == freezed
          ? _value.dialCode
          : dialCode // ignore: cast_nullable_to_non_nullable
              as String,
      flag: flag == freezed
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CountryCopyWith<$Res> implements $CountryCopyWith<$Res> {
  factory _$CountryCopyWith(_Country value, $Res Function(_Country) then) =
      __$CountryCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String description,
      String code,
      String dialCode,
      String flag});
}

/// @nodoc
class __$CountryCopyWithImpl<$Res> extends _$CountryCopyWithImpl<$Res>
    implements _$CountryCopyWith<$Res> {
  __$CountryCopyWithImpl(_Country _value, $Res Function(_Country) _then)
      : super(_value, (v) => _then(v as _Country));

  @override
  _Country get _value => super._value as _Country;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? code = freezed,
    Object? dialCode = freezed,
    Object? flag = freezed,
  }) {
    return _then(_Country(
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
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      dialCode: dialCode == freezed
          ? _value.dialCode
          : dialCode // ignore: cast_nullable_to_non_nullable
              as String,
      flag: flag == freezed
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Country implements _Country {
  _$_Country(
      {this.id = 1,
      required this.name,
      this.description = '',
      this.code = '',
      this.dialCode = '',
      this.flag = ''});

  factory _$_Country.fromJson(Map<String, dynamic> json) =>
      _$$_CountryFromJson(json);

  @JsonKey()
  @override
  final int id;
  @override
  final String name;
  @JsonKey()
  @override
  final String description;
  @JsonKey()
  @override
  final String code;
  @JsonKey()
  @override
  final String dialCode;
  @JsonKey()
  @override
  final String flag;

  @override
  String toString() {
    return 'Country(id: $id, name: $name, description: $description, code: $code, dialCode: $dialCode, flag: $flag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Country &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.dialCode, dialCode) &&
            const DeepCollectionEquality().equals(other.flag, flag));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(dialCode),
      const DeepCollectionEquality().hash(flag));

  @JsonKey(ignore: true)
  @override
  _$CountryCopyWith<_Country> get copyWith =>
      __$CountryCopyWithImpl<_Country>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CountryToJson(this);
  }
}

abstract class _Country implements Country {
  factory _Country(
      {int id,
      required String name,
      String description,
      String code,
      String dialCode,
      String flag}) = _$_Country;

  factory _Country.fromJson(Map<String, dynamic> json) = _$_Country.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get code;
  @override
  String get dialCode;
  @override
  String get flag;
  @override
  @JsonKey(ignore: true)
  _$CountryCopyWith<_Country> get copyWith =>
      throw _privateConstructorUsedError;
}
