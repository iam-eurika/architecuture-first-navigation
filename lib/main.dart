import 'package:architecture_first_navigation/bloc/navigation/navigation_bloc.dart';
import 'package:architecture_first_navigation/routes/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationBloc>(
      create: (context) => NavigationBloc(),
      child: BlocListener<NavigationBloc, NavigationState>(
        listener: (context, state) {
          final router = GoRouter.router;

          if (state is NavigationLogoutState) {
            router.go('/home');
          } else if (state is NavigationNavigateState) {
            router.go(state.route);
          }
        },
        child: MaterialApp.router(
          routerConfig: GoRouter.router,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
        ),
      ),
    );
  }
}
