import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_faq/bloc/meetings/meetings_bloc.dart';
import 'package:student_faq/consts/color_palette.dart';
import 'package:student_faq/consts/styles/button_styles.dart';
import 'package:student_faq/consts/styles/text_styles.dart';
import 'package:student_faq/models/meeting/meeting_model.dart';
import 'package:student_faq/pages/meetings/meeting_card.dart';
import 'package:student_faq/router.dart';
import 'package:student_faq/widgets/pages_drawer.dart';
import 'package:student_faq/widgets/search_bar.dart';

import '../../utils/utils.dart';

class MeetingsPage extends StatefulWidget {
  const MeetingsPage({super.key, required this.groupId});
  final String groupId;

  @override
  State<MeetingsPage> createState() => _MeetingsPageState();
}

class _MeetingsPageState extends State<MeetingsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MeetingsBloc(),
      child: Builder(builder: (context) {
        BlocProvider.of<MeetingsBloc>(context)
            .add(FetchMoreMeetingsEvent(widget.groupId));
        return Scaffold(
          drawer: const PagesDrawer(),
          floatingActionButton: FloatingActionButton.large(
            onPressed: () {
              MyRouter.router.goNamed(Routes.addMeeting.name,
                  pathParameters: {"groupId": widget.groupId});
            },
            heroTag: "addProgramme",
            child: Icon(
              Icons.add,
              color: ColorPalette.snowWhiteColor,
            ),
          ),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
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
                          heroTag: "sideBar",
                          child: Icon(
                            Icons.menu,
                            color: ColorPalette.snowWhiteColor,
                          ));
                    }),
                    Expanded(child: Container()),
                    Text("SPOTKANIA", style: TextStyles.pageTitle),
                    Expanded(child: Container()),
                  ],
                ),
                const SizedBox(height: 32),
                const MySearchBar(),
                const SizedBox(height: 16),
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
                    const SizedBox(
                      width: 32,
                    ),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        label: Text("SORTOWANIE",
                            style: TextStyle(color: ColorPalette.brown)),
                        icon:
                            Icon(Icons.sort_rounded, color: ColorPalette.brown),
                        style: ButtonStyles.optionsElevatedButton,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Builder(builder: (context) {
                    return BlocBuilder<MeetingsBloc, MeetingsState>(
                        builder: (context, state) {
                      if (state is FetchingMeetingsState) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state is SuccessfullyFetchedMeetingsState) {
                        List<Meeting> meetings =
                            BlocProvider.of<MeetingsBloc>(context)
                                .fetchedMeetings;
                        final Map<DateTime, int> dates = {};
                        int alreadyLoadedMeetingsCount = -1;
                        for (var meeting in meetings) {
                          final date = DateTime(
                              meeting.creationDate.year,
                              meeting.creationDate.month,
                              meeting.creationDate.day);
                          dates.update(date, (count) => count + 1,
                              ifAbsent: () => 1);
                        }

                        return ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: dates.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 40),
                            itemBuilder: (context, index) {
                              var dateKey = dates.keys.elementAt(index);
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        Utils.getDateString(dateKey),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 21,
                                            fontWeight: FontWeight.w600,
                                            color: ColorPalette.brown),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 2,
                                    color: ColorPalette.brown,
                                  ),
                                  ListView.separated(
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        alreadyLoadedMeetingsCount += 1;
                                        return MeetingCard(
                                            meeting: meetings.elementAt(
                                                alreadyLoadedMeetingsCount));
                                      },
                                      separatorBuilder: (context, index) {
                                        return const SizedBox(height: 16);
                                      },
                                      itemCount: dates[dateKey]!),
                                ],
                              );
                            });
                      }
                      if (state is FailedToFetchMeetingsState) {
                        return const Text(
                            "Error occured fetching meetings!\n:/");
                      }
                      return const Text("Something went wrong :/");
                    });
                  }),
                ),
              ],
            ),
          )),
        );
      }),
    );
  }
}
