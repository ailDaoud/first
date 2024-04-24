import 'package:first_task2/Pages/btn.dart';
import 'package:first_task2/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Localaiz.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
          title: Text("title".tr()),
          actions: [
            Tooltip(
              message: "ddd",
              child: IconButton(
                icon: const Icon(Icons.language),
                onPressed: () {
                  LocalizationCheker.changeLanguage(context);
                },
              ),
            )
          ],
        ),
        body: Column(children: [
          Card(
            child: ListTile(
              title: Text("first".tr()),
              subtitle: Text("second".tr()),
            ),
          ),
         const SizedBox(height: 140,),
         BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            if(state is CounterInitial){
              return Center(child: const Text("0",style: TextStyle(color: Colors.amber,fontSize: 30),));
            }
            else if(state is CounterChange){
              return Center(child: Text(state.con.toString(),style: const TextStyle(color: Colors.amber,fontSize: 30),));
            }
            else{
              return Center(child: const Text("Something is wrong",style: TextStyle(color: Colors.amber,fontSize: 30),));
            }
          },
         )
        ]),
        floatingActionButton: const Float_btn());
  }
}