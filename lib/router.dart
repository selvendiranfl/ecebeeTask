


import 'allimports.dart';

class AppRoutes{

  static const String loginScreen = "loginScreen";
  static const String plugInScreen = "plugInScreen";
  static const String loginListScreen = "plugScreen";
}


Route<dynamic>? getRoute(RouteSettings settings){
  switch(settings.name){
    case AppRoutes.loginScreen:
      return _buildLogInScreen(settings);
    case AppRoutes.plugInScreen:
      return _buildPlugInScreen(settings);
    case AppRoutes.loginListScreen:
      return _buildLoginListScreen(settings);


  }
  return null;
}

Route<dynamic> _buildLogInScreen(RouteSettings settings) {
  return CustomPageRoute(child: PageBuilder.buildHomepageScreen(settings));
}

Route<dynamic> _buildPlugInScreen(RouteSettings settings) {
  return CustomPageRoute(child: PageBuilder.buildPlugInScreen(settings));
}

Route<dynamic> _buildLoginListScreen(RouteSettings settings) {
  return CustomPageRoute(child: PageBuilder.buildLoginListScreen(settings));
}


class PageBuilder{
  static Widget buildHomepageScreen(RouteSettings settings) {
    return BlocProvider(
      create: (BuildContext context) => LoginScreenBloc(),
      child: LoginScreen(),
    );
  }
  static Widget buildPlugInScreen(RouteSettings settings) {
    return BlocProvider(
      create: (BuildContext context) => PluginScreenBloc()..add(LoginDetailsSaveEvent()),
      child: PluginScreen(),
    );
  }
  static Widget buildLoginListScreen(RouteSettings settings) {
    return BlocProvider(
      create: (BuildContext context) => LoginListScreenBloc()..add(FetchLoginDetailsEvent()),
      child: LoginListScreen(),
    );
  }
}
