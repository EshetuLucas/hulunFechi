import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hulunfechi/datamodels/post/post_model.dart';

import '../app_data_model.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User {
  User._();

  factory User({
    required int id,
    required String username,
    String? fullname,
    required String firstname,
    required String lastname,
    required String email,
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
    @Default([]) List<Country?> usercountry,
    @Default([]) List<Category?> usercategories,
  }) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class UserForm with _$UserForm {
  UserForm._();

  factory UserForm({
    required int id,
    required String username,
    required String email,
    required String password,
    required String accessToken,
    required String tokenType,
    List<String>? roles,
  }) = _UserForm;
  factory UserForm.fromJson(Map<String, dynamic> json) =>
      _$UserFormFromJson(json);
}
