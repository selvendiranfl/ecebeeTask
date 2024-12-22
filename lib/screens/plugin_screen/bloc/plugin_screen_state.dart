part of 'plugin_screen_bloc.dart';

@immutable
sealed class PluginScreenState {}

final class PluginScreenInitial extends PluginScreenState {}

final class LoginDetailsSaveState extends PluginScreenState {}

final class QRDetailsSaveState extends PluginScreenState {}

final class QRDetailsSaveFailedState extends PluginScreenState {}
