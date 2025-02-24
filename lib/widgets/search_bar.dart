import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_faq/bloc/search_bar/search_bar_cubit.dart';
import 'package:student_faq/consts/color_palette.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({super.key});

  @override
  State<MySearchBar> createState() => My_SearchBarState();
}

class My_SearchBarState extends State<MySearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (String query) {
        BlocProvider.of<SearchBarCubit>(context).changeQuery(query);
      },
      decoration: InputDecoration(
          fillColor: ColorPalette.snowWhiteColor,
          border: OutlineInputBorder(),
          hintText: "Wyszukaj Przedmiot",
          suffixIcon: Icon(Icons.search)),
    );
  }
}
