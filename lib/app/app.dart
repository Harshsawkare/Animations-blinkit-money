import 'package:flutter/material.dart';
import '../features/wallet/presentation/screens/wallet_screen.dart';

/// Root of the widget tree. Configures the [MaterialApp] with dark theme
/// and mounts the wallet screen as the initial route.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Harsh Sawkare',
      debugShowCheckedModeBanner: false,
      // Use a minimal dark theme — all visual details are handled inside
      // each widget to stay true to the design without theming overrides.
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF1A1B0D),
      ),
      home: const WalletScreen(),
    );
  }
}
