part of 'plugin_screen_bloc.dart';

@immutable
sealed class PluginScreenEvent {}


class LoginDetailsSaveEvent extends PluginScreenEvent {}

class QRDetailsSaveEvent extends PluginScreenEvent {}


