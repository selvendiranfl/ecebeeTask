import "package:ecebee/allimports.dart";
import "package:supabase_flutter/supabase_flutter.dart";

import "helper/navigatorService.dart";



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    url: 'https://jqcqodvzkzzndsifqfnq.supabase.co', // Replace with your Supabase URL
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpxY3FvZHZ6a3p6bmRzaWZxZm5xIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ4MDE0MjgsImV4cCI6MjA1MDM3NzQyOH0.YZMgaiMAaQ9A91bvoJ_CjQm5ZRdPwqDVr3Rw8Bsslas', // Replace with your Supabase anon key
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  BlocProvider(
        create: (context) => LoginScreenBloc(),
        child: LoginScreen(),
      ),
      navigatorKey: NavigationService.navigatorKey,
      onGenerateRoute: getRoute,
    );

  }
}


