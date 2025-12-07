import 'package:architecture_first_navigation/bloc/navigation/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSubRoute1 extends StatelessWidget {
  const HomeSubRoute1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Sub Route 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Home Sub Route 1',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<NavigationBloc>().add(
                      NavigationNavigateToEvent('/home'),
                    );
              },
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
