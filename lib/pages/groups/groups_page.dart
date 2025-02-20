import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_faq/bloc/groups/groups_bloc.dart';
import 'package:student_faq/consts/color_palette.dart';
import 'package:student_faq/consts/styles/button_styles.dart';
import 'package:student_faq/consts/styles/text_styles.dart';
import 'package:student_faq/pages/groups/group_card.dart';
import 'package:student_faq/router.dart';
import 'package:student_faq/widgets/pages_drawer.dart';
import 'package:student_faq/widgets/search_bar.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: PagesDrawer(),
        floatingActionButton: FloatingActionButton.large(
          onPressed: () {},
          child: Icon(
            Icons.add,
            color: ColorPalette.snowWhiteColor,
          ),
          heroTag: "addProgramme",
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Builder(builder: (context) {
                    return FloatingActionButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: Icon(
                          Icons.menu,
                          color: ColorPalette.snowWhiteColor,
                        ),
                        heroTag: "sideBar");
                  }),
                  Expanded(child: Container()),
                  Text("TWOJE GRUPY", style: TextStyles.pageTitle),
                  Expanded(child: Container()),
                ],
              ),
              SizedBox(height: 32),
              MySearchBar(),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      label: Text("FILTRY",
                          style: TextStyle(color: ColorPalette.brown)),
                      icon: Icon(Icons.filter_alt_rounded,
                          color: ColorPalette.brown),
                      style: ButtonStyles.optionsElevatedButton,
                    ),
                  ),
                  SizedBox(
                    width: 32,
                  ),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      label: Text("SORTOWANIE",
                          style: TextStyle(color: ColorPalette.brown)),
                      icon: Icon(Icons.sort_rounded, color: ColorPalette.brown),
                      style: ButtonStyles.optionsElevatedButton,
                    ),
                  )
                ],
              ),
              SizedBox(height: 16),
              Text(
                "2024L",
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                    color: ColorPalette.brown),
              ),
              Divider(
                thickness: 2,
                color: ColorPalette.brown,
              ),
              Expanded(
                child: BlocBuilder<GroupsBloc, GroupsState>(
                    builder: (context, state) {
                  if (state is GroupsStateFetched) {
                    print(BlocProvider.of<GroupsBloc>(context).groups);
                    return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GroupCard(
                          group: BlocProvider.of<GroupsBloc>(context)
                              .groups
                              .elementAt(index),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 16);
                      },
                      itemCount:
                          BlocProvider.of<GroupsBloc>(context).groups.length,
                    );
                  }
                  else if (state is GroupsStateAddingGroups) {
                    return CircularProgressIndicator();
                  }

                    else if (state is GroupsStateError) {
                    return Text("Error");
                  }
                    if (
                    BlocProvider.of<GroupsBloc>(context)
                        .groups.length == 0
                    ) {
                      return Row(children: [Text("Nie jesteś jeszcze w żadnej grupie ;/")]);
                    }
                  return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GroupCard(
                        group: BlocProvider.of<GroupsBloc>(context)
                            .groups
                            .elementAt(index),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 16);
                    },
                    itemCount:
                    BlocProvider.of<GroupsBloc>(context).groups.length,
                  );
                }),
              )
            ],
          ),
        )));
  }
}
