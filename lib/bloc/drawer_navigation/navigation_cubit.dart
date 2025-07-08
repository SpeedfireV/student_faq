import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_faq/router.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(HomePageNavigationState());
  void changePage(NavigationState newPageState) {
    switch (newPageState) {
      case HomePageNavigationState():
        {
          MyRouter.router.go("/home_page");
        }
      case GroupsPageNavigationState():
        {
          MyRouter.router.go("/groups");
        }
      case MeetingsPageNavigationState():
        {
          MyRouter.router.go("/meetings");
        }
      case UniversitiesPageNavigationState():
        {
          MyRouter.router.go("/universities");
        }
      case ReportProblemPageNavigationState():
        {
          MyRouter.router.go("/report");
        }
      case SettingsPageNavigationState():
        {
          MyRouter.router.go("/settings");
        }
      default:
        {
          MyRouter.router.go("/home_page");
        }
    }
    emit(newPageState);
  }
}
