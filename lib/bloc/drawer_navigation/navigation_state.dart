part of 'navigation_cubit.dart';

@immutable
sealed class NavigationState {}

class HomePageNavigationState extends NavigationState {}

class GroupsPageNavigationState extends NavigationState {}

class MeetingsPageNavigationState extends NavigationState {}

class UniversitiesPageNavigationState extends NavigationState {}

class ReportProblemPageNavigationState extends NavigationState {}

class SettingsPageNavigationState extends NavigationState {}
