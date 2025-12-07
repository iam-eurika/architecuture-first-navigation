part of 'navigation_bloc.dart';

abstract class NavigationEvent {}

class NavigationNavigateToEvent extends NavigationEvent {
  final String route;
  
  NavigationNavigateToEvent(this.route);
}

class NavigationLogoutNavigationEvent extends NavigationEvent {
  NavigationLogoutNavigationEvent();
}

