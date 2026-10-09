import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/theme/app_theme.dart';
import 'screens/onboarding/splash_screen.dart';
import 'screens/home/main_shell_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Set status bar styling to match modern transparent iOS/Android UI
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );

  runApp(const ZemenGoApp());
}

class ZemenGoApp extends StatelessWidget {
  const ZemenGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZemenGo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
      routes: {
        '/home': (context) => const MainShellScreen(),
      },
    );
  }
}
