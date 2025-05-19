import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_faq/bloc/meetings/meetings_bloc.dart';
import 'package:student_faq/consts/color_palette.dart';
import 'package:student_faq/consts/styles/button_styles.dart';
import 'package:student_faq/consts/styles/text_styles.dart';
import 'package:student_faq/models/meeting/meeting_model.dart';
import 'package:student_faq/pages/meetings/meeting_card.dart';
import 'package:student_faq/widgets/pages_drawer.dart';
import 'package:student_faq/widgets/search_bar.dart';

class MeetingsPage extends StatefulWidget {
  const MeetingsPage({super.key, required this.groupId });
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
  child: Builder(
    builder: (context) {
      BlocProvider.of<MeetingsBloc>(context).add(FetchMoreMeetingsEvent(widget.groupId));
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
                          child: Icon(
                            Icons.menu,
                            color: ColorPalette.snowWhiteColor,
                          ),
                          heroTag: "sideBar");
                    }),
                    Expanded(child: Container()),
                    Text("SPOTKANIA", style: TextStyles.pageTitle),
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
                  "15.02.2025",
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                      color: ColorPalette.brown),
                ),
                Divider(
                  thickness: 2,
                  color: ColorPalette.brown,
                ),

                Builder(
                  builder: (context) {
                    return BlocBuilder<MeetingsBloc, MeetingsState>(builder: (context, state) {
                      print(state);
                      if (state is FetchingMeetingsState) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (state is SuccessfullyFetchedMeetingsState) {
                        return ListView.separated(itemBuilder: (context, index) {
                          return MeetingCard();
                        }, separatorBuilder: (context, index) {
                          return SizedBox(height: 16);
                        }, itemCount: BlocProvider.of<MeetingsBloc>(context).fetchedMeetings.length);
                      }
                      if (state is FailedToFetchMeetingsState) {
                        return Text("Error occured fetching meetings!\n:/");
                      }
                      return Text("Something went wrong :/");


                    });
                  }
                ),
              ],
            ),
          )),
        );
    }
  ),
);
  }
}
