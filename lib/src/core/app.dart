import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

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

class DialogDashHomeScreen extends StatefulWidget {
  const DialogDashHomeScreen({super.key});

  @override
  State<DialogDashHomeScreen> createState() => _DialogDashHomeScreenState();
}

class _DialogDashHomeScreenState extends State<DialogDashHomeScreen> {
  tryGenerativeApi() async {
    const apiKey = String.fromEnvironment('API_KEY', defaultValue: '');

    final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
    final content = [Content.text('Write a story about a magic backpack.')];
    final response = await model.generateContent(content);
    log(response.text.toString(), name: 'AI Response');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => tryGenerativeApi(),
        child: const Icon(Icons.circle_outlined),
      ),
      body: const Center(
        child: Text('DialogDash'),
      ),
    );
  }
}
