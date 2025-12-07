part of 'navigation_bloc.dart';

abstract class NavigationState {}

class NavigationInitial extends NavigationState {}

class NavigationNavigateState extends NavigationState {
  final String route;
  
  NavigationNavigateState(this.route);
}

class NavigationLogoutState extends NavigationState {}

