import 'package:dialog_dash/src/features/features.dart';
import 'package:dialog_dash/src/shared/shared.dart';
import 'package:flutter/material.dart';

class DialogDashApp extends StatelessWidget {
  const DialogDashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const ChatScreen(),
    );
  }
}
