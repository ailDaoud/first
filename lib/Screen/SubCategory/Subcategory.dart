import 'package:first_task2/Model/SubCategorymodel.dart';
import 'package:first_task2/Screen/SubCategory/bloc/sub_category_bloc.dart';
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
    return Scaffold(
     body:BlocBuilder<SubCategoryBloc, SubCategoryState>(
        builder: (context, state) {
          if (state is GetSubCategoryFailed) {
            return const Text("wrongggggg");
          } else if (state is GetSubCategorySucsess) {
            return ReSubCat(
              subcat: state.subcat,
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class ReSubCat extends StatelessWidget {
  final List<SubCat> subcat;
  ReSubCat({
    super.key,
    required this.subcat,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 1000,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: subcat.length, //cate.data!.categories.length,
                itemBuilder: (context, index) {
                  return
                      //   physics: NeverScrollableScrollPhysics(),
                      //   scrollDirection: Axis.vertical,
                   //   InkWell(
                   // child: 
                    Column(
                      children: [
                        Text("${subcat[index].name}"),
                        Text(
                          "${subcat[index].price}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    );
                //  );
                }),
          ),
        ],
      ),
    );
  }
}
