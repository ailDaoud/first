import 'package:first_task2/bloc/bloc/bloc/sub_category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubCategory extends StatefulWidget {
  const SubCategory({super.key});

  @override
  State<SubCategory> createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  @override
  void initState() {
    BlocProvider.of<SubCategoryBloc>(context).add(StartSubCat());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
