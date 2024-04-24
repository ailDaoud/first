import 'package:first_task2/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Float_btn extends StatelessWidget {
  const Float_btn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          onPressed: () {
            BlocProvider.of<CounterBloc>(context).add(CounterPlusOne());
          },
          child: const Icon(Icons.plus_one),
        ),
        const SizedBox(
          height: 10,
        ),
        FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(CounterMinusone());
            },
            child: const Icon(Icons.minimize))
      ],
    );
  }
}
