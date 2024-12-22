part of 'login_list_screen_bloc.dart';

@immutable
sealed class LoginListScreenState {}

final class LoginListScreenInitial extends LoginListScreenState {}

final class FetchLoginDetailsState extends LoginListScreenState {}

final class FetchLoginDetailsFailedState extends LoginListScreenState {}
