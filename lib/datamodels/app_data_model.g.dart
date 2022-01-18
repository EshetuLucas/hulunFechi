// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Location _$$_LocationFromJson(Map<String, dynamic> json) => _$_Location(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      placeId: json['placeId'] as String?,
    );

Map<String, dynamic> _$$_LocationToJson(_$_Location instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'placeId': instance.placeId,
    };

_$_Event _$$_EventFromJson(Map<String, dynamic> json) => _$_Event(
      id: json['id'] as int,
      eventName: json['eventName'] as String,
      eventDescription: json['eventDescription'] as String,
      beginDate: json['beginDate'] as String,
      endDate: json['endDate'] as String,
      ticketingBeginDate: json['ticketingBeginDate'] as String,
      ticketingEndDate: json['ticketingEndDate'] as String,
      eventCategory: json['eventCategory'] as String,
      eventCategoryId: json['eventCategoryId'] as String,
      eventType: json['eventType'] as String,
      organizerName: json['organizerName'] as String,
      tinNumber: json['tinNumber'] as String?,
    );

Map<String, dynamic> _$$_EventToJson(_$_Event instance) => <String, dynamic>{
      'id': instance.id,
      'eventName': instance.eventName,
      'eventDescription': instance.eventDescription,
      'beginDate': instance.beginDate,
      'endDate': instance.endDate,
      'ticketingBeginDate': instance.ticketingBeginDate,
      'ticketingEndDate': instance.ticketingEndDate,
      'eventCategory': instance.eventCategory,
      'eventCategoryId': instance.eventCategoryId,
      'eventType': instance.eventType,
      'organizerName': instance.organizerName,
      'tinNumber': instance.tinNumber,
    };

_$_UserAccount _$$_UserAccountFromJson(Map<String, dynamic> json) =>
    _$_UserAccount(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      userType: json['userType'] as String,
      status: json['status'] as String,
      mobile: json['mobile'] as String?,
    );

Map<String, dynamic> _$$_UserAccountToJson(_$_UserAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'userType': instance.userType,
      'status': instance.status,
      'mobile': instance.mobile,
    };

_$_Country _$$_CountryFromJson(Map<String, dynamic> json) => _$_Country(
      id: json['id'] as int? ?? 1,
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      code: json['code'] as String? ?? '',
      dialCode: json['dialCode'] as String? ?? '',
      flag: json['flag'] as String? ?? '',
    );

Map<String, dynamic> _$$_CountryToJson(_$_Country instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'code': instance.code,
      'dialCode': instance.dialCode,
      'flag': instance.flag,
    };
