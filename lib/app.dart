import 'package:flutter/material.dart';

class DialogDashApp extends StatelessWidget {
  const DialogDashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dialog Dash',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const DialogDashHomeScreen(),
    );
  }
}

class DialogDashHomeScreen extends StatelessWidget {
  const DialogDashHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('DialogDash'),
      ),
    );
  }
}
