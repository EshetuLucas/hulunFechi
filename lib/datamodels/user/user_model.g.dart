// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int,
      username: json['username'] as String,
      fullname: json['fullname'] as String?,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      email: json['email'] as String,
      country: json['country'] as String?,
      phone: json['phone'] as String?,
      profession: json['profession'] as String?,
      dob: json['dob'] as String?,
      region: json['region'] as String?,
      city: json['city'] as String?,
      woreda: json['woreda'] as String?,
      subcity: json['subcity'] as String?,
      housenumber: json['housenumber'] as String?,
      state: json['state'] as String?,
      street: json['street'] as String?,
      ssn: json['ssn'] as String?,
      account: json['account'] as String?,
      bank: json['bank'] as String?,
      accessToken: json['accessToken'] as String?,
      tokenType: json['tokenType'] as String?,
      tin: json['tin'] as String?,
      profilePicPath: json['profilePicPath'] as String?,
      usercountry: (json['usercountry'] as List<dynamic>?)
              ?.map((e) => Country.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      following: (json['following'] as List<dynamic>?)
              ?.map((e) => User.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      usercategories: (json['usercategories'] as List<dynamic>?)
              ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'fullname': instance.fullname,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'country': instance.country,
      'phone': instance.phone,
      'profession': instance.profession,
      'dob': instance.dob,
      'region': instance.region,
      'city': instance.city,
      'woreda': instance.woreda,
      'subcity': instance.subcity,
      'housenumber': instance.housenumber,
      'state': instance.state,
      'street': instance.street,
      'ssn': instance.ssn,
      'account': instance.account,
      'bank': instance.bank,
      'accessToken': instance.accessToken,
      'tokenType': instance.tokenType,
      'tin': instance.tin,
      'profilePicPath': instance.profilePicPath,
      'usercountry': instance.usercountry,
      'following': instance.following,
      'usercategories': instance.usercategories,
    };

_$_UserForm _$$_UserFormFromJson(Map<String, dynamic> json) => _$_UserForm(
      id: json['id'] as int,
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      accessToken: json['accessToken'] as String,
      tokenType: json['tokenType'] as String,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_UserFormToJson(_$_UserForm instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'accessToken': instance.accessToken,
      'tokenType': instance.tokenType,
      'roles': instance.roles,
    };
