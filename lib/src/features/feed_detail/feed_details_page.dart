import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:using_go_router/src/router/router_named.dart';

class FeedDetailsPage extends StatelessWidget {
  const FeedDetailsPage({super.key, required this.id});

  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(RoutesNamed.feedSetting);
        },
        child: const Icon(Icons.settings),
      ),
      body: Center(
        child: Text(
          id,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
