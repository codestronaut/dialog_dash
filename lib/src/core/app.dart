import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../shared/shared.dart';
import 'navigation/navigation.dart';

class DialogDashApp extends StatefulWidget {
  const DialogDashApp({super.key});

  @override
  State<DialogDashApp> createState() => _DialogDashAppState();
}

class _DialogDashAppState extends State<DialogDashApp> {
  final router = GoRouter(
    routes: $appRoutes,
    initialLocation: SignInRoute().location,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Dialog Dash',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: context.mindfulOrange),
        scaffoldBackgroundColor: context.mindfulCream,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: context.mindfulBrown,
        ),
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: router,
    );
  }
}
