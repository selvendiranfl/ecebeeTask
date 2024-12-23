part of 'login_screen_bloc.dart';

@immutable
sealed class LoginScreenEvent {}

class LoginEvent extends LoginScreenEvent {}

class OtpVerifyEvent extends LoginScreenEvent {}

class GetLocationEvent extends LoginScreenEvent {}
