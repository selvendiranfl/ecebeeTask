part of 'login_list_screen_bloc.dart';

@immutable
sealed class LoginListScreenEvent {}

class FetchLoginDetailsEvent extends LoginListScreenEvent {}
