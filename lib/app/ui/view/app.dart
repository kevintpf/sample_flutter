import 'package:flutter/material.dart';
import 'package:sample_flutter/app/app.dart';
import 'package:sample_flutter/app/ui/view/navigation.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: appTheme,
      routerConfig: router,
    );
  }
}
