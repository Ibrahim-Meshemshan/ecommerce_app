// To parse this JSON data, do
//
//     final authResponseModel = authResponseModelFromJson(jsonString);

import 'dart:convert';

class RegisterResponseEntity {
  final String? message;
  final UserEntity? user;
  final String? token;

  RegisterResponseEntity({
    this.message,
    this.user,
    this.token,
  });
//eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3ODkxZDI2NTE5NzUzMmY3MWExMjhmOCIsIm5hbWUiOiJpYnJhaGltX21lc2giLCJyb2xlIjoidXNlciIsImlhdCI6MTczNzAzOTE0MywiZXhwIjoxNzQ0ODE1MTQzfQ.fNrnneq2dMuWpcvKfV90M-f_9mLYH2N9QR1URawChB8
}

class UserEntity { 
  final String? name;
  final String? email;

  UserEntity({
    this.name,
    this.email,
  });
}
