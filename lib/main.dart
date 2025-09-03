import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Exemples/app_router.dart';

void main() {
  runApp(MonApp());
}

class MonApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Navigation structurée',
        onGenerateRoute: _appRouter.onGenerateRoute,
        initialRoute: AppRouter.accueil,
      ),
    );
  }
}