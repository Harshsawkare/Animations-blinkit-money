import 'package:flutter/material.dart';
import 'package:harshsawkare/core/constants/app_constants.dart';
import '../core/theme/app_colors.dart';
import '../features/wallet/presentation/screens/wallet_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: const WalletScreen(),
    );
  }
}
