import 'package:flutter/material.dart';
import 'app/app.dart';

/// Entry point — keeps main() minimal and delegates everything to [App].
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}
