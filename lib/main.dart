import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zilmoney_machine_test/presentation/users_list_screen.dart';

import 'injection/container.dart';

void main() {
  setupDependencies();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User List',
      home: UsersListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
