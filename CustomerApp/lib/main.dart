import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/app_colors.dart';
import 'screens/onboarding/splash_screen.dart';
import 'screens/home/main_shell_screen.dart';
import 'screens/onboarding/onboarding_screen.dart';
import 'core/state/demo_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await DemoStore.instance.initialize();
  } catch (_) {
    DemoStore.instance.storageError =
        'Local storage is unavailable on this device.';
  }

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
  const ZemenGoApp({super.key, this.store});
  final DemoStore? store;

  @override
  Widget build(BuildContext context) {
    final appStore = store ?? DemoStore.instance;
    return DemoScope(
      store: appStore,
      child: MaterialApp(
        title: 'ZemenGo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        builder: (context, child) => AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: AppColors.surface,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
          child: child!,
        ),
        home: SplashScreen(
          nextScreen: appStore.signedIn
              ? const MainShellScreen()
              : const OnboardingScreen(),
        ),
        routes: {'/home': (context) => const MainShellScreen()},
      ),
    );
  }
}
