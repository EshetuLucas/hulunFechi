import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_data_model.freezed.dart';
part 'app_data_model.g.dart';

@freezed
class Location with _$Location {
  Location._();
  factory Location({
    double? latitude,
    double? longitude,
    String? placeId,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

@freezed
class Category with _$Category {
  Category._();
  factory Category({
    required int id,
    required String name,
    String? description,
    String? status,
    double? longitude,
    String? placeId,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@freezed
class Event with _$Event {
  Event._();
  factory Event({
    required int id,
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
    String? tinNumber,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}

@freezed
class UserAccount with _$UserAccount {
  UserAccount._();
  factory UserAccount({
    required int id,
    required String name,
    required String email,
    required String userType,
    required String status,
    String? mobile,
  }) = _UserAccount;

  factory UserAccount.fromJson(Map<String, dynamic> json) =>
      _$UserAccountFromJson(json);
}
