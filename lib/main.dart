import 'package:examen_final_pons/screens/details_screen.dart';

import 'services/arbre_service.dart';
import 'package:examen_final_pons/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/screens.dart';


void main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init(); 
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ArbreService()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: 'login',
      routes: {
        'home': (_) => HomeScreen(),
        'details': (_) => DetailScreen(),
        'login': (_) => LoginScreen(),
      },
    );
  }
}
