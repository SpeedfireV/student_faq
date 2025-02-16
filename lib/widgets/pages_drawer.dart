import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_faq/bloc/drawer_navigation/navigation_cubit.dart';
import 'package:student_faq/consts/color_palette.dart';

class PagesDrawer extends StatefulWidget {
  const PagesDrawer({super.key});

  @override
  State<PagesDrawer> createState() => _PagesDrawerState();
}

class _PagesDrawerState extends State<PagesDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorPalette.lightBlue,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _drawerButton(
                  newPageState: HomePageNavigationState(),
                  text: "STRONA GŁÓWNA",
                  icon: Icons.home),
              _drawerButton(
                newPageState: GroupsPageNavigationState(),
                text: "GRUPY",
                icon: Icons.bookmark_add_rounded,
              ),
              _drawerButton(
                  newPageState: MeetingsPageNavigationState(),
                  text: "SPOTKANIA",
                  icon: Icons.people),
              _drawerButton(
                  newPageState: UniversitiesPageNavigationState(),
                  text: "MOJE UCZELNIE",
                  icon: Icons.school),
              _drawerButton(
                  newPageState: ReportProblemPageNavigationState(),
                  text: "ZGŁOŚ PROBLEM",
                  icon: Icons.flag),
              _drawerButton(
                  newPageState: SettingsPageNavigationState(),
                  text: "USTAWIENIA",
                  icon: Icons.settings),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerButton(
      {required NavigationState newPageState,
      required String text,
      required IconData icon}) {
    bool selected =
        BlocProvider.of<NavigationCubit>(context).state.runtimeType ==
            newPageState.runtimeType;
    return Ink(
      width: double.infinity,
      height: 60,
      color: selected ? ColorPalette.darkOrangeColor : ColorPalette.lightBlue,
      child: InkWell(
        onTap: () {
          BlocProvider.of<NavigationCubit>(context).changePage(newPageState);
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              SizedBox(width: 16),
              Icon(
                icon,
                color: selected
                    ? ColorPalette.snowWhiteColor
                    : ColorPalette.darkOrangeColor,
              ),
              SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                    color: selected
                        ? ColorPalette.snowWhiteColor
                        : ColorPalette.darkOrangeColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
