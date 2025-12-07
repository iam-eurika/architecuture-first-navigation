import 'package:architecture_first_navigation/bloc/navigation/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Home Screen',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<NavigationBloc>().add(
                      NavigationNavigateToEvent('/home/subroute1'),
                    );
              },
              child: const Text('Go to Sub Route 1'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.read<NavigationBloc>().add(
                      NavigationNavigateToEvent('/home/subroute2'),
                    );
              },
              child: const Text('Go to Sub Route 2'),
            ),
          ],
        ),
      ),
    );
  }
}
