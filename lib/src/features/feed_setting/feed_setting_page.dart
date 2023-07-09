import 'package:flutter/material.dart';

class FeedSettingPage extends StatelessWidget {
  const FeedSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed Setting Page'),
      ),
      body: Center(
        child: Text(
          'Setting Page',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
