import 'package:bloc/bloc.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitial()) {
    on<NavigationNavigateToEvent>(_onNavigateTo);
    on<NavigationLogoutNavigationEvent>(_onLogoutNavigation);
  }

  void _onNavigateTo(
    NavigationNavigateToEvent event,
    Emitter<NavigationState> emit,
  ) {
    emit(NavigationNavigateState(event.route));
  }

  void _onLogoutNavigation(
    NavigationLogoutNavigationEvent event,
    Emitter<NavigationState> emit,
  ) {
    emit(NavigationLogoutState());
  }
}

