import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_faq/bloc/groups/groups_bloc.dart';
import 'package:student_faq/bloc/search_bar/search_bar_cubit.dart';
import 'package:student_faq/consts/color_palette.dart';
import 'package:student_faq/consts/styles/button_styles.dart';
import 'package:student_faq/consts/styles/text_styles.dart';
import 'package:student_faq/pages/groups/group_card.dart';
import 'package:student_faq/router.dart';
import 'package:student_faq/widgets/buttons.dart';
import 'package:student_faq/widgets/pages_drawer.dart';
import 'package:student_faq/widgets/search_bar.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();


  }

  @override
  Widget build(BuildContext context) {


    return BlocProvider(
      create: (context) => SearchBarCubit(),
      child: Builder(
        builder: (context) {
          BlocProvider.of<GroupsBloc>(context).add(GroupsEventFetchNextGroups());
          return Scaffold(
              drawer: PagesDrawer(),
              floatingActionButton: FloatingActionButton.large(
                onPressed: () {
                  showDialog(context: context, builder: (context) {
                    return Dialog(child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 16),
                        Text("Nowa Grupa",  style: TextStyles.dialogTitle, textAlign: TextAlign.center,),
                        SizedBox(height: 16),
                        TextIconButton(function: () {
                          if (MyRouter.router.canPop())
                          {
                            MyRouter.router.pop();
                            MyRouter.router.goNamed(Routes.addGroup.name);
                          }
                        }, text: "Nowa Grupa", icon: Icon(Icons.person_add)),
                        TextIconButton(function: () {
                          if (MyRouter.router.canPop())
                          {
                            MyRouter.router.pop();
                            MyRouter.router.goNamed(Routes.joinGroup.name);
                          }

                        }, text: "Dołacz Do Grupy", icon: Icon(Icons.add)),
                        SizedBox(height: 8),
                        TextButton(onPressed: () {
                          if (MyRouter.router.canPop())
                            {

                              MyRouter.router.pop();
                            }
                        },child: Text("Close", style: TextStyle(color: ColorPalette.alertColor, fontSize: 16), )),
                      SizedBox(height: 16)
                      ],
                    ),);
                  });
                  // MyRouter.router.goNamed(Routes.addGroup.name);
                },
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
                            onPressed: () {
                              showModalBottomSheet(context: context, builder: (context) {
                                return BottomSheet(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),onClosing: () {

                                }, builder: (context) {
                                  return Column(children: [
                                    Row(
                                      children: [
                                        SizedBox(width: 64),
                                        Expanded(child: Align(alignment: Alignment.center,child: Text("FILTRY", textAlign: TextAlign.center,))),
                                        IconButton(onPressed: () {
                                          if (MyRouter.router.canPop()){
                                            MyRouter.router.pop();
                                          }


                                        }, icon: Icon(Icons.close, color: ColorPalette.darkBlue,))
                                      ],
                                    )
                                  ],);
                                })
          ;                        });
                            },
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
                            onPressed: () {

                              showModalBottomSheet(context: context, builder: (context) {
                                return BottomSheet(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),onClosing: () {

                                }, builder: (context) {
                                  return Column(children: [
                                    Row(
                                      children: [
                                        SizedBox(width: 64),
                                        Expanded(child: Align(alignment: Alignment.center,child: Text("SORTOWANIE", textAlign: TextAlign.center,))),
                                        IconButton(onPressed: () {
                                          if (MyRouter.router.canPop()){
                                            MyRouter.router.pop();
                                          }


                                        }, icon: Icon(Icons.close, color: ColorPalette.darkBlue,))
                                      ],
                                    )
                                  ],);
                                })
                                ;                        });
                            },
                            label: Text("SORTOWANIE",
                                style: TextStyle(color: ColorPalette.brown)),
                            icon: Icon(Icons.sort_rounded, color: ColorPalette.brown),
                            style: ButtonStyles.optionsElevatedButton,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: BlocBuilder<GroupsBloc, GroupsState>(
                            builder: (context, state) {

                          if (state is GroupsStateFetched) {
                            return ListView(
                              children: [ListView.separated(
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return GroupCard(
                                    group: BlocProvider.of<GroupsBloc>(context)
                                        .groups
                                        .elementAt(index),
                                    groupId: BlocProvider.of<GroupsBloc>(context).groupsUids.elementAt(index),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: 16);
                                },
                                itemCount:
                                    BlocProvider.of<GroupsBloc>(context).groups.length,
                              ),
                              SizedBox(height: 16)]
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
                              return Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("Nie jesteś jeszcze w żadnej grupie ;/")]);
                            }
                          return Text("Something went wrong! :/");
                        }),
                      ),
                    )
                  ],
                ),
              )));
        }
      ),
    );
  }
}
