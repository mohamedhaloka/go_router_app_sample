import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    print('Home initState');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const Center(
        child: Text('Click to Floating Action Button'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed('feed_list');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
