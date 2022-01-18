import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hulunfechi/enums/group.dart';
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

@freezed
// class Post with _$Post {
//   Post._();
//   factory Post({
//     required int id,
//     required String userId,
//     required String userProfilePic,
//     required String userName,
//     required Group group,
//     required String country,
//     required String platform,
//     required String category,
//     required String subCategory,
//     required String title,
//     required String body,
//     required int likes,
//     required int comments,
//     required int share,
//   }) = _Post;

//   factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
// }

@freezed
class Country with _$Country {
  factory Country({
    @Default(1) int id,
    required String name,
    @Default('') String description,
    @Default('') String code,
    @Default('') String dialCode,
    @Default('') String flag,
  }) = _Country;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}
