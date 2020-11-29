import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

@JsonSerializable()

/// model for performing login
class LoginRequest {
  /// constructor
  LoginRequest(this.username, this.password);

  /// converson from json to model
  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  /// username form field
  final String username;

  /// password form field
  final String password;

  /// conversor from model to json
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

@JsonSerializable()

/// model for login response
class LoginResponse {
  /// constructor
  LoginResponse(this.token, this.kind);

  /// conversion from json to model
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  /// token issued for session
  final String token;

  /// token kind
  final String kind;
}
