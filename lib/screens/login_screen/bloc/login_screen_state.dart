part of 'login_screen_bloc.dart';

@immutable
sealed class LoginScreenState {}

final class LoginScreenInitial extends LoginScreenState {}

final class LoginState extends LoginScreenState {}

final class OtpVerifiedState extends LoginScreenState {}

final class OtpfailedState extends LoginScreenState {}

final class LocationFetchState extends LoginScreenState {}


