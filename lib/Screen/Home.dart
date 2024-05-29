import 'package:first_task2/Model/Categoriesmodel.dart';
import 'package:first_task2/Model/trendymodel.dart';
import 'package:first_task2/bloc/Content/content_bloc.dart';
import 'package:first_task2/bloc/bloc/trendy_bloc.dart';
import 'package:first_task2/main.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

const baseurl = "https://asp-enjoyed-bonefish.ngrok-free.app";
const baseurl2 = 'https://jamfurniture.000webhostapp.com';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<ContentBloc>(context).add(StartCategory());
    BlocProvider.of<TrendyBloc>(context).add(Starttrendy());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text("Home"),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SearchField(),
                Categoryy(),
                SizedBox(
                  height: 20,
                ),
                SSS(),
              ],
            ),
          ),
        ));
  }
}

class Categoryy extends StatelessWidget {
  Categoryy({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContentBloc, ContentState>(
      builder: (context, state) {
        if (state is GetCategoryFailed) {
          return const Text("wrongggggg");
        } else if (state is GetCategorySucsess) {
          return Sucsess(
            category: state.getcategory,
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class Sucsess extends StatelessWidget {
  final List<Category> category;
  Sucsess({
    super.key,
    required this.category,
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 80.0,
        margin: const EdgeInsets.only(top: 16),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: category.length, //cate.data!.categories.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () async {
                  sharedPreferences!.setInt("catid", category[index].id);
                  context.go('/supcat');
                },
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Text("${category[index].name}"),
                    ),
                    CircleAvatar(
                        maxRadius: 30,
                        minRadius: 20,
                        child: Image(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "${baseurl2 + category[index].image}"))),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class SSS extends StatelessWidget {
  SSS({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendyBloc, TrendyState>(
      builder: (context, state) {
        if (state is GetTrendyFailed) {
          return const Text("wrongggggg");
        } else if (state is GetTrendySucsess) {
          return Sucsesss(
            trendy: state.trendy,
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class Sucsesss extends StatelessWidget {
  final List<Datum> trendy;
  Sucsesss({
    super.key,
    required this.trendy,
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
                itemCount: trendy.length, //cate.data!.categories.length,
                itemBuilder: (context, index) {
                  return
                      //   physics: NeverScrollableScrollPhysics(),
                      //   scrollDirection: Axis.vertical,
                      InkWell(
                    child: Column(
                      children: [
                        Image(
                          image:
                              NetworkImage("${baseurl2 + trendy[index].image}"),
                          fit: BoxFit.cover,
                        ),
                        Text("${trendy[index].name}"),
                        Text(
                          "${trendy[index].price}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                        /* Container(
                                                                margin: EdgeInsets.only(right: 10.0),
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                ),
                                                                child: Text("${trendy[index].name}"),
                                                              ),*/
                        /*  CircleAvatar(
                                                                  maxRadius: 30,
                                                                  minRadius: 20,
                                                                  child: Image(
                                                                      fit: BoxFit.fill,
                                                                      image: NetworkImage(
                                                                          "${baseurl2 + trendy[index].image}"))),*/
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        onChanged: (value) {},
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.blueAccent.withOpacity(0.1),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          border: searchOutlineInputBorder,
          focusedBorder: searchOutlineInputBorder,
          enabledBorder: searchOutlineInputBorder,
          hintText: "Search product",
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}

const searchOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);
